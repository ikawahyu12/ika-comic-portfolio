import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/project_model.dart';

class ProjectService {
  static const String baseUrl =
      'http://172.16.103.160/portfolio_api/api';

  Future<List<Project>> getProjects() async {
    try {
      final uri = Uri.parse('$baseUrl/projects.php');

      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(
          'Server error: ${response.statusCode}',
        );
      }

      final Map<String, dynamic> body = jsonDecode(response.body);

      if (body['success'] != true) {
        throw Exception(
          'API mengembalikan status gagal',
        );
      }

      final List<dynamic> data = body['data'] ?? [];

      return data
          .map((item) => Project.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(
        'Gagal mengambil data project: $e',
      );
    }
  }

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
        Uri.parse('$baseUrl/projects.php'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'title': title,
          'description': description,
          'category': category,
          'technologies': technologies,
          'image': image,
          'github_url': githubUrl,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception(
          'Server error: ${response.statusCode}',
        );
      }

      final Map<String, dynamic> body = jsonDecode(response.body);

      if (body['success'] != true) {
        throw Exception(
          body['message'] ?? 'Gagal menambahkan project',
        );
      }

      return true;
    } catch (e) {
      throw Exception(
        'Gagal menambahkan project: $e',
      );
    }
  }

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
        Uri.parse('$baseUrl/projects.php'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'id': id,
          'title': title,
          'description': description,
          'category': category,
          'technologies': technologies,
          'image': image,
          'github_url': githubUrl,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception(
          'Server error: ${response.statusCode}',
        );
      }

      final Map<String, dynamic> body = jsonDecode(response.body);

      if (body['success'] != true) {
        throw Exception(
          body['message'] ?? 'Gagal memperbarui portfolio',
        );
      }

      return true;
    } catch (e) {
      throw Exception(
        'Gagal memperbarui portfolio: $e',
      );
    }
  }

  Future<bool> deleteProject(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/projects.php'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'id': id,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception(
          'Server error: ${response.statusCode}',
        );
      }

      final Map<String, dynamic> body = jsonDecode(response.body);

      if (body['success'] != true) {
        throw Exception(
          body['message'] ?? 'Gagal menghapus portfolio',
        );
      }

      return true;
    } catch (e) {
      throw Exception(
        'Gagal menghapus portfolio: $e',
      );
    }
  }
}