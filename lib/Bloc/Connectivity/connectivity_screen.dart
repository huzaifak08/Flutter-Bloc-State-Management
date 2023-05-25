import 'package:bloc_statemanagement/Bloc/Connectivity/connectivity_bloc.dart';
import 'package:bloc_statemanagement/Bloc/Connectivity/connectivity_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connectivity Screen')),
      body: Center(
        // BlocBuilder(builder: builder) --> work with UI.
        // BlocListener(listener: listener) --> work with Snackbar etc widgets.(works in Background)
        // BlocConsumer(builder: builder, listener: listener) --> Use BlocBuilder + BlocListener

        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            // "==" to check value
            // "is" to check dataType

            if (state is InternetGainedState) {
              return Text('Internet Gained State');
            } else if (state is InternetLostState) {
              return Text('Internet Lost State');
            } else {
              return Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
