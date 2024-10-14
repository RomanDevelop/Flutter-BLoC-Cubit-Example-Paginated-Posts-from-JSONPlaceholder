import 'package:flutter_streamcontroller/models/post.dart';
import 'package:flutter_streamcontroller/repository/post_repository.dart';

class MockPostRepository implements PostRepository {
  @override
  Future<List<Post>> fetchPosts(int start, int limit) async {
    await Future.delayed(Duration(seconds: 1)); // Симуляция задержки
    return List.generate(
      limit,
      (index) => Post(
        id: start + index,
        title: 'Mock Post ${start + index}',
        body: 'This is a mock post body.',
      ),
    );
  }
}
