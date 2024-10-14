import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_streamcontroller/cubit/post_cubit.dart';
import 'package:flutter_streamcontroller/post_screen.dart';
import 'package:flutter_streamcontroller/repository/post_repository_factory.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => PostCubit(PostRepositoryFactory.create()),
        child: PostScreen(),
      ),
    );
  }
}
