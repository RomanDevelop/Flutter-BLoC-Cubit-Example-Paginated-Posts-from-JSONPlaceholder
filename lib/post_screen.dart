import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_streamcontroller/cubit/post_cubit.dart';
import 'package:flutter_streamcontroller/cubit/post_state.dart';
import 'package:chucker_flutter/chucker_flutter.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          // Добавляем встроенную кнопку Chucker
          ChuckerFlutter.chuckerButton,
        ],
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.posts[index].title),
                  subtitle: Text(state.posts[index].body),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('You will find a lot of ...'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostCubit>().fetchPosts();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
