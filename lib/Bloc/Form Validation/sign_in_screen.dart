import 'package:bloc_statemanagement/Bloc/Form%20Validation/sign_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signInBloc = BlocProvider.of<SignInBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.error,
                    style: TextStyle(color: Colors.red),
                  );
                } else
                  return Container();
              },
            ),
            SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                signInBloc.add(SignInTextChangeEvent(
                    emailController.text, passwordController.text));
              },
            ),
            SizedBox(height: 12),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                signInBloc.add(SignInTextChangeEvent(
                    emailController.text, passwordController.text));
              },
            ),
            SizedBox(height: 12),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return CupertinoButton(
                    child: Text('Sign In'),
                    color:
                        (state is SignInValidState) ? Colors.blue : Colors.grey,
                    onPressed: () {
                      if (state is SignInValidState) {
                        signInBloc.add(SignInSubmittedEvent(
                            emailController.text, passwordController.text));
                      }
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
