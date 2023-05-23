import 'package:bloc_statemanagement/Firestore/data_model.dart';
import 'package:bloc_statemanagement/Firestore/database_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DatabaseService databaseService;

  DataBloc(this.databaseService) : super(DataInitialState()) {
    // Data Send Event:

    on<DataSendEvent>((event, emit) async {
      emit(DataLoadingState());

      try {
        await databaseService.saveDataToFirestore(event.name, event.price);
        emit(DataSendState());
      } catch (e) {
        emit(DataErrorState(e.toString()));
      }
    });

    // Data Read Event:
    on<DataReadEvent>((event, emit) async {
      emit(DataLoadingState());

      try {
        List<DataModel> data = await databaseService.getData();
        emit(DataReadState(data: data));
      } catch (e) {
        emit(DataErrorState(e.toString()));
      }
    });

    // Data Delete Event:
    on<DataDeleteEvent>((event, emit) async {
      emit(DataLoadingState());

      try {
        await databaseService.deleteData(event.documentId);
        emit(DataDeleteState());
      } catch (e) {
        emit(DataErrorState(e.toString()));
      }
    });

    // Data Update Event:
    on<DataUpdateEvent>((event, emit) async {
      emit(DataLoadingState());

      try {
        await databaseService.updateData(
            event.documentId, event.name, event.price);
        emit(DataUpdateState());
      } catch (e) {
        emit(DataErrorState(e.toString()));
      }
    });
  }
}

// Events:

abstract class DataEvent {}

class DataSendEvent extends DataEvent {
  final String name;
  final String price;
  DataSendEvent({required this.name, required this.price});
}

class DataReadEvent extends DataEvent {}

class DataDeleteEvent extends DataEvent {
  final String documentId;
  DataDeleteEvent({required this.documentId});
}

class DataUpdateEvent extends DataEvent {
  final String documentId;
  final String name;
  final String price;
  DataUpdateEvent(
      {required this.name, required this.price, required this.documentId});
}

// States:

abstract class DataState {}

class DataSendState extends DataState {}

class DataReadState extends DataState {
  final List<DataModel> data;
  DataReadState({required this.data});
}

class DataDeleteState extends DataState {}

class DataUpdateState extends DataState {}

class DataErrorState extends DataState {
  final String error;
  DataErrorState(this.error);
}

class DataInitialState extends DataState {}

class DataLoadingState extends DataState {}
