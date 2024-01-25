import 'package:bloc_statemanagement/bloc/counter/counter_bloc.dart';
import 'package:bloc_statemanagement/bloc/favourite/favourite_bloc.dart';
import 'package:bloc_statemanagement/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_statemanagement/bloc/post/post_bloc.dart';
import 'package:bloc_statemanagement/bloc/switch/switch_bloc.dart';
import 'package:bloc_statemanagement/bloc/todo/todo_bloc.dart';
import 'package:bloc_statemanagement/repository/favourite_repo.dart';
import 'package:bloc_statemanagement/screens/post_screen.dart';
import 'package:bloc_statemanagement/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository())),
        BlocProvider(create: (_) => PostBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PostScreen(),
      ),
    );
  }
}
