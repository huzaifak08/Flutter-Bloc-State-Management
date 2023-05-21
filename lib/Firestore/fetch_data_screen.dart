import 'package:flutter/material.dart';

class FetchDataFirestoreScreen extends StatelessWidget {
  const FetchDataFirestoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Data Bloc')),
      body: Column(children: []),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
