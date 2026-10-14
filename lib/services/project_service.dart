import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../models/project_model.dart';

class ProjectService {
  // URL Laravel REST API
  static const String baseUrl = 'http://127.0.0.1:8000/api/projects';

  static String? resolveImageUrl(String? image) {
    final imagePath = image?.trim();
    if (imagePath == null || imagePath.isEmpty) return null;

    final imageUri = Uri.tryParse(imagePath);
    if (imageUri?.hasScheme == true || imagePath.startsWith('assets/')) {
      return imagePath;
    }

    final apiUri = Uri.parse(baseUrl);
    final normalizedPath = imagePath
        .replaceAll(r'\', '/')
        .replaceFirst(RegExp(r'^public/'), '');
    final storagePath = normalizedPath.startsWith('storage/')
        ? '/$normalizedPath'
        : '/storage/$normalizedPath';

    return apiUri.replace(path: storagePath).toString();
  }

  // READ: mengambil semua proyek
  Future<List<Project>> getProjects() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      final Map<String, dynamic> body =
          jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200 || body['success'] != true) {
        throw Exception(body['message'] ?? 'Gagal mengambil data proyek');
      }

      final List<dynamic> data = body['data'] as List<dynamic>;

      return data.map((item) {
        final projectData = Map<String, dynamic>.from(
          item as Map<String, dynamic>,
        );
        projectData['image'] = resolveImageUrl(
          projectData['image']?.toString(),
        );
        return Project.fromJson(projectData);
      }).toList();
    } catch (e) {
      throw Exception('Gagal mengambil data proyek: $e');
    }
  }

  Future<bool> createProject({
    required String title,
    required String description,
    required String category,
    required String technologies,
    String? githubUrl,
    XFile? imageFile,
  }) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(baseUrl));
      request.fields.addAll({
        'title': title,
        'description': description,
        'category': category,
        'technologies': technologies,
        'github_url': githubUrl ?? '',
      });

      if (imageFile != null) {
        final lowerName = imageFile.name.toLowerCase();
        final allowedExtensions = ['.jpg', '.jpeg', '.png', '.webp'];

        if (!allowedExtensions.any((ext) => lowerName.endsWith(ext))) {
          throw Exception(
            'Format gambar tidak didukung. Gunakan JPG, PNG, atau WEBP.',
          );
        }

        final bytes = await imageFile.readAsBytes();
        request.files.add(
          http.MultipartFile.fromBytes(
            'image',
            bytes,
            filename: imageFile.name,
          ),
        );
      }

      final streamedResponse = await request.send();
      final responseBody = await streamedResponse.stream.bytesToString();
      final Map<String, dynamic> body =
          jsonDecode(responseBody) as Map<String, dynamic>;

      if (streamedResponse.statusCode != 201 || body['success'] != true) {
        throw Exception(body['message'] ?? 'Gagal menambahkan proyek');
      }

      return true;
    } catch (e) {
      throw Exception('Gagal menambahkan proyek: $e');
    }
  }

  Future<bool> updateProject({
    required int id,
    required String title,
    required String description,
    required String category,
    required String technologies,
    String? githubUrl,
    XFile? imageFile,
  }) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse('$baseUrl/$id'));
      request.fields['_method'] = 'PUT';
      request.fields.addAll({
        'title': title,
        'description': description,
        'category': category,
        'technologies': technologies,
        'github_url': githubUrl ?? '',
      });

      if (imageFile != null) {
        final lowerName = imageFile.name.toLowerCase();
        final allowedExtensions = ['.jpg', '.jpeg', '.png', '.webp'];

        if (!allowedExtensions.any((ext) => lowerName.endsWith(ext))) {
          throw Exception(
            'Format gambar tidak didukung. Gunakan JPG, PNG, atau WEBP.',
          );
        }

        final bytes = await imageFile.readAsBytes();
        request.files.add(
          http.MultipartFile.fromBytes(
            'image',
            bytes,
            filename: imageFile.name,
          ),
        );
      }

      final streamedResponse = await request.send();
      final responseBody = await streamedResponse.stream.bytesToString();
      final Map<String, dynamic> body =
          jsonDecode(responseBody) as Map<String, dynamic>;

      if (streamedResponse.statusCode != 200 || body['success'] != true) {
        throw Exception(body['message'] ?? 'Gagal memperbarui proyek');
      }

      return true;
    } catch (e) {
      throw Exception('Gagal memperbarui proyek: $e');
    }
  }

  // DELETE: menghapus proyek
  Future<bool> deleteProject(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      final Map<String, dynamic> body =
          jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200 || body['success'] != true) {
        throw Exception(body['message'] ?? 'Gagal menghapus proyek');
      }

      return true;
    } catch (e) {
      throw Exception('Gagal menghapus proyek: $e');
    }
  }
}
