import 'package:flutter_streamcontroller/repository/api_post_repository.dart';
import 'package:flutter_streamcontroller/repository/mock_post_repository.dart';
import 'package:flutter_streamcontroller/repository/post_repository.dart';

class PostRepositoryFactory {
  static PostRepository create({bool isMock = false}) {
    if (isMock) {
      return MockPostRepository();
    } else {
      return ApiPostRepository('https://jsonplaceholder.typicode.com');
    }
  }
}
