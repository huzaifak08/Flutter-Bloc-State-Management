import 'package:bloc_statemanagement/Authentication/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is SignInState) {
            // Navigate to next Screen:
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Successfully Logged in')));
          }
        },
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(hintText: 'Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          authBloc.add(SignInEvent(
                              emailController.text, passwordController.text));
                        }
                      },
                      child: const Text('Login')),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
