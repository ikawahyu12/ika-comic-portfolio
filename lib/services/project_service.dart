
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/project_model.dart';

class ProjectService {
  // URL Laravel REST API
  static const String baseUrl = 'http://127.0.0.1:8000/api/projects';

  // READ: mengambil semua proyek
  Future<List<Project>> getProjects() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      final Map<String, dynamic> body =
          jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200 || body['success'] != true) {
        throw Exception(
          body['message'] ?? 'Gagal mengambil data proyek',
        );
      }

      final List<dynamic> data = body['data'] as List<dynamic>;

      return data
          .map(
            (item) => Project.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Gagal mengambil data proyek: $e');
    }
  }

  // CREATE: menambahkan proyek
  Future<bool> createProject({
    required String title,
    required String description,
    required String category,
    required String technologies,
    String? image,
    String? githubUrl,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'description': description,
          'category': category,
          'technologies': technologies,
          'image': image,
          'github_url': githubUrl,
        }),
      );

      final Map<String, dynamic> body =
          jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 201 || body['success'] != true) {
        throw Exception(
          body['message'] ?? 'Gagal menambahkan proyek',
        );
      }

      return true;
    } catch (e) {
      throw Exception('Gagal menambahkan proyek: $e');
    }
  }

  // UPDATE: memperbarui proyek
  Future<bool> updateProject({
    required int id,
    required String title,
    required String description,
    required String category,
    required String technologies,
    String? image,
    String? githubUrl,
  }) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'description': description,
          'category': category,
          'technologies': technologies,
          'image': image,
          'github_url': githubUrl,
        }),
      );

      final Map<String, dynamic> body =
          jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200 || body['success'] != true) {
        throw Exception(
          body['message'] ?? 'Gagal memperbarui proyek',
        );
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
        throw Exception(
          body['message'] ?? 'Gagal menghapus proyek',
        );
      }

      return true;
    } catch (e) {
      throw Exception('Gagal menghapus proyek: $e');
    }
  }
}