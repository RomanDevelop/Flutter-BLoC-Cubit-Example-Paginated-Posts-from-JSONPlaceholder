import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/post_cubit.dart';
import 'cubit/post_state.dart';
import 'repository/post_repository.dart';
import 'models/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostCubit(PostRepository())..fetchPosts(),
        child: PostScreen(),
      ),
    );
  }
}

class PostScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<PostCubit>().fetchPosts();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Cubit Posts'),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostInitial ||
              state is PostLoading &&
                  (state as PostLoading).runtimeType == PostInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is PostLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              itemBuilder: (context, index) {
                if (index < state.posts.length) {
                  Post post = state.posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
