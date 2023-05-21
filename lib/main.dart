import 'package:bloc_statemanagement/Counter/counter_block.dart';
import 'package:bloc_statemanagement/Firestore/data_bloc.dart';
import 'package:bloc_statemanagement/Firestore/database_service.dart';
import 'package:bloc_statemanagement/Firestore/read_data_screen.dart';
import 'package:bloc_statemanagement/Firestore/create_data_screen.dart';
import 'package:bloc_statemanagement/Message/message_block.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<MessageBloc>(create: (context) => MessageBloc()),
        BlocProvider<DataBloc>(create: (context) => DataBloc(DatabaseService()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ReadDataScreen(),
      ),
    );
  }
}
