import 'package:bloc_statemanagement/Bloc/API%20Handling/api_screen.dart';
import 'package:bloc_statemanagement/Bloc/API%20Handling/post_cubit.dart';
import 'package:bloc_statemanagement/Bloc/Authentication/auth_bloc.dart';
import 'package:bloc_statemanagement/Bloc/Firestore/data_bloc.dart';
import 'package:bloc_statemanagement/Bloc/Firestore/database_service.dart';
import 'package:bloc_statemanagement/Bloc/Form%20Validation/sign_in_bloc.dart';
import 'package:bloc_statemanagement/Cubit/connectivity_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/Authentication/auth_service.dart';
import 'Bloc/Counter/counter_block.dart';
import 'Bloc/Message/message_block.dart';

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
        BlocProvider<DataBloc>(
            create: (context) => DataBloc(DatabaseService())),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(AuthService())),
        BlocProvider<InternetCubit>(create: (context) => InternetCubit()),
        BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
        BlocProvider<PostCubit>(create: (context) => PostCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const APIScreen(),
      ),
    );
  }
}
