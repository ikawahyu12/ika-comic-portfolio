import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/project_model.dart';

class ProjectService {
  static const String baseUrl =
      'http://192.168.1.3/portfolio_api/api';

  Future<List<Project>> getProjects() async {
    try {
      final uri = Uri.parse('$baseUrl/projects.php');

      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(
          'Server error: ${response.statusCode}',
        );
      }

      final Map<String, dynamic> body =
          jsonDecode(response.body);

      if (body['success'] != true) {
        throw Exception(
          'API mengembalikan status gagal',
        );
      }

      final List<dynamic> data = body['data'] ?? [];

      return data
          .map(
            (item) => Project.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();
    } catch (e) {
      throw Exception(
        'Gagal mengambil data project: $e',
      );
    }
  }
}