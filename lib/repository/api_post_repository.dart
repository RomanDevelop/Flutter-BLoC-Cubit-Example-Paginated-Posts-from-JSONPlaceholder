import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter_streamcontroller/models/post.dart';
import 'package:flutter_streamcontroller/repository/post_repository.dart';

class ApiPostRepository implements PostRepository {
  final String baseUrl;
  late http.Client client;

  ApiPostRepository(this.baseUrl) {
    // Используем ChuckerHttpClient для перехвата HTTP-запросов
    client = ChuckerHttpClient(http.Client());
  }

  @override
  Future<List<Post>> fetchPosts(int start, int limit) async {
    final response = await client.get(
      Uri.parse('$baseUrl/posts?_start=$start&_limit=$limit'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
