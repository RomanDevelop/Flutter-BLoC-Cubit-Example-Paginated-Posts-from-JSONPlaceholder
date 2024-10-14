import 'package:bloc/bloc.dart';
import '../repository/post_repository.dart';
import 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository _postRepository;

  int _currentPage = 0;
  final int _limit = 10;

  PostCubit(this._postRepository) : super(PostInitial());

  void fetchPosts() async {
    if (state is PostLoaded && (state as PostLoaded).hasReachedMax) return;

    try {
      if (state is PostInitial) {
        emit(PostLoading());
        final posts =
            await _postRepository.fetchPosts(_currentPage * _limit, _limit);
        emit(PostLoaded(posts: posts, hasReachedMax: posts.length < _limit));
      } else if (state is PostLoaded) {
        final currentState = state as PostLoaded;
        final posts =
            await _postRepository.fetchPosts(_currentPage * _limit, _limit);
        emit(currentState.copyWith(
          posts: currentState.posts + posts,
          hasReachedMax: posts.length < _limit,
        ));
      }
      _currentPage++;
    } catch (error) {
      emit(PostError(message: error.toString()));
    }
  }
}
