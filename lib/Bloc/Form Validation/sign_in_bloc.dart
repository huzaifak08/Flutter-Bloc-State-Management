import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    //Text Change Event:

    on<SignInTextChangeEvent>((event, emit) {
      if (event.email == '') {
        emit(SignInErrorState('Enter Valid email'));
      } else if (event.password.length <= 7) {
        emit(SignInErrorState('Password must be greater than 7 Charachters'));
      } else {
        emit(SignInValidState());
      }
    });

    // Submitted Event:

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}

// Events:

abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  final String email;
  final String password;
  SignInTextChangeEvent(this.email, this.password);
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent(this.email, this.password);
}

// States

abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInValidState extends SignInState {}

class SignInSubmittedState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  final String error;
  SignInErrorState(this.error);
}
