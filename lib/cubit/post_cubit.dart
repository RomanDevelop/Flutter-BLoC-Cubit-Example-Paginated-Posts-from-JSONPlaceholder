import 'package:bloc/bloc.dart';
import 'package:flutter_streamcontroller/cubit/post_state.dart';
import 'package:flutter_streamcontroller/repository/post_repository.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository repository;
  int _currentStart = 0;
  final int _limit = 10;

  PostCubit(this.repository) : super(PostInitial());

  Future<void> fetchPosts() async {
    emit(PostLoading());
    try {
      final posts = await repository.fetchPosts(_currentStart, _limit);
      _currentStart += _limit;
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
