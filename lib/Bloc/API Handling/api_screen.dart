import 'package:bloc_statemanagement/Bloc/API%20Handling/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class APIScreen extends StatelessWidget {
  const APIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Handling')),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoadedState) {
            return ListView.builder(
              itemCount: state.postList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.postList[index].title.toString()),
                  subtitle: Text(state.postList[index].body.toString()),
                );
              },
            );
          } else if (state is PostInitialState) {
            return const Text('This is Initial State');
          } else if (state is PostErrorState) {
            return Text(state.error.toString());
          } else {
            return const Text(
                'Some Other Error'); // In case Internet is not Connected etc
          }
        },
      ),
    );
  }
}
