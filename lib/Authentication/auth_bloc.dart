import 'package:bloc_statemanagement/Authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService;

  AuthBloc(this.authService) : super(InitialState()) {
    // Register:

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoadingState());

      try {
        await authService.registerUser(event.email, event.password);
        emit(SignUpState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    // Login:
    on<SignInEvent>((event, emit) async {
      emit(AuthLoadingState());

      try {
        await authService.loginUser(event.email, event.password);
        emit(SignInState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });
  }
}

// Events:

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  SignUpEvent(this.email, this.password);
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  SignInEvent(this.email, this.password);
}

class InitialEvent extends AuthEvent {}

class AuthLoadingEvent extends AuthEvent {}

// States:

abstract class AuthState {}

class SignUpState extends AuthState {}

class SignInState extends AuthState {}

class InitialState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
}

class AuthLoadingState extends AuthState {}
