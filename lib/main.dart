import 'package:bloc_statemanagement/Counter/counter_block.dart';
import 'package:bloc_statemanagement/Counter/counter_screen.dart';
import 'package:bloc_statemanagement/Message/message_block.dart';
import 'package:bloc_statemanagement/Message/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<MessageBloc>(create: (context) => MessageBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MessageScreen(),
      ),
    );
  }
}
