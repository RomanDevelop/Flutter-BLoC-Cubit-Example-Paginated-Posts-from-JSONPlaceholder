import 'dart:convert';
import 'package:flutter_streamcontroller/models/post.dart';
import 'package:flutter_streamcontroller/repository/post_repository.dart';
import 'package:http/http.dart' as http;

class ApiPostRepository implements PostRepository {
  final String baseUrl;

  ApiPostRepository(this.baseUrl);

  @override
  Future<List<Post>> fetchPosts(int start, int limit) async {
    final response =
        await http.get(Uri.parse('$baseUrl/posts?_start=$start&_limit=$limit'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
