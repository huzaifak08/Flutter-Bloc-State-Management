import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBloc extends Bloc<MessageEvent, String> {
  MessageBloc() : super('Initially Empty') {
    on<SendMessageEvent>((event, emit) => emit('Message Send Successfully'));
    on<FailedMessageEvent>((event, emit) => emit('Message Failed to send'));
  }
}

// Events:
abstract class MessageEvent {}

class SendMessageEvent extends MessageEvent {}

class FailedMessageEvent extends MessageEvent {}
