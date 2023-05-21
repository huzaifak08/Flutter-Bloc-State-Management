// import 'package:bloc_statemanagement/Firestore/data_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SendDataFirestoreScreen extends StatelessWidget {
//   const SendDataFirestoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final dataBloc = BlocProvider.of<DataBloc>(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Send Data Bloc')),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(hintText: 'Name'),
//             ),
//             SizedBox(height: 12),
//             TextField(
//               decoration: InputDecoration(hintText: 'Price'),
//             ),
//             SizedBox(height: 12),
//             ElevatedButton(onPressed: () {}, child: Text('Send Data'))
//           ],
//         ),
//       ),
//     );
//   }
// }
