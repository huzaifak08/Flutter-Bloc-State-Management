import 'package:bloc_statemanagement/Bloc/Message/message_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider:
    final messageBloc = BlocProvider.of<MessageBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Message Bloc')),
      body: Center(child: BlocBuilder<MessageBloc, String>(
        builder: (context, state) {
          return Text(state);
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              messageBloc.add(SendMessageEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              messageBloc.add(FailedMessageEvent());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
