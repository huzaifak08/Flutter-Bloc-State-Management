import 'package:bloc_statemanagement/Cubit/connectivity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubitScreen extends StatelessWidget {
  const ConnectivityCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connectivity Cubit Screen')),
      body: Center(
        // "==" to check value --> use this in case of enum states:
        // "is" to check dataType

        child: BlocBuilder<InternetCubit, InternetCubitState>(
          builder: (context, state) {
            if (state == InternetCubitState.Gained) {
              return Text('Connection Gained');
            } else if (state == InternetCubitState.Initial) {
              return Text('Initial State');
            } else {
              return Text('Connection Lost');
            }
          },
        ),
      ),
    );
  }
}
