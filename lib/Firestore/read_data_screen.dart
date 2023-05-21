import 'package:bloc_statemanagement/Firestore/create_data_screen.dart';
import 'package:flutter/material.dart';

class ReadDataScreen extends StatelessWidget {
  const ReadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Data Bloc')),
      body: Column(children: []),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateDataScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
