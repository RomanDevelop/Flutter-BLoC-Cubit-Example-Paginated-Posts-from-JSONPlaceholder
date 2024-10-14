import 'package:flutter_streamcontroller/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts(int start, int limit);
}
