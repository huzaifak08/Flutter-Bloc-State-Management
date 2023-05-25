import 'package:bloc_statemanagement/Bloc/Firestore/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDataScreen extends StatelessWidget {
  const CreateDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DataBloc dataBloc = BlocProvider.of<DataBloc>(context);

    final nameController = TextEditingController();
    final priceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Send Data Bloc')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: priceController,
              decoration: InputDecoration(hintText: 'Price'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  dataBloc.add(DataSendEvent(
                      name: nameController.text, price: priceController.text));

                  Navigator.pop(context);
                },
                child: Text('Send Data'))
          ],
        ),
      ),
    );
  }
}
