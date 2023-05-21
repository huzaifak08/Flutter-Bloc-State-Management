// import 'package:bloc_statemanagement/Firestore/database_service.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DataBloc extends Bloc<DataEvent, DataState> {
//   DatabaseService databaseService;

//   DataBloc(this.databaseService) : super(DataInitialState());

//   Stream<DataState> mapEventToState(DataEvent event) async* {
//     if (event is DataSendEvent) {
//       yield DataLoadingState();

//       try {
//         await databaseService.saveDataToFirestore(event.name, event.price);
//         yield DataSendState();
//       } catch (e) {
//         DataErrorState(e.toString());
//       }
//     }
//   }
// }

// // Events:

// abstract class DataEvent {}

// class DataSendEvent extends DataEvent {
//   final String name;
//   final String price;
//   DataSendEvent(this.name, this.price);
// }

// // States:

// abstract class DataState {}

// class DataSendState extends DataState {}

// class DataErrorState extends DataState {
//   final String error;
//   DataErrorState(this.error);
// }

// class DataInitialState extends DataState {}

// class DataLoadingState extends DataState {}
