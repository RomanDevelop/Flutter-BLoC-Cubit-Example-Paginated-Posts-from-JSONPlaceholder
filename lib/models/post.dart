import 'dart:convert';

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  static List<Post> fromJsonList(String jsonString) {
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((json) => Post.fromJson(json)).toList();
  }
}
