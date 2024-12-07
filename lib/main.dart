import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_streamcontroller/cubit/post_cubit.dart';
import 'package:flutter_streamcontroller/post_screen.dart';
import 'package:flutter_streamcontroller/repository/post_repository_factory.dart';
import 'package:chucker_flutter/chucker_flutter.dart';

void main() {
  // Настройка Chucker
  ChuckerFlutter.showOnRelease = false;
  ChuckerFlutter.showNotification = true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      home: BlocProvider(
        create: (context) => PostCubit(PostRepositoryFactory.create()),
        child: PostScreen(),
      ),
    );
  }
}
