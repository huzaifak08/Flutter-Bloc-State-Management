import 'package:bloc_statemanagement/Firestore/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateDataScreen extends StatelessWidget {
  final String documentId;
  final String oldName;
  final String oldPrice;
  const UpdateDataScreen(
      {super.key,
      required this.documentId,
      required this.oldName,
      required this.oldPrice});

  @override
  Widget build(BuildContext context) {
    final DataBloc dataBloc = BlocProvider.of<DataBloc>(context);

    final nameController = TextEditingController();
    final priceController = TextEditingController();

    nameController.text = oldName;
    priceController.text = oldPrice;

    return Scaffold(
      appBar: AppBar(title: const Text('Update Data Bloc')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(hintText: 'Price'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  dataBloc.add(DataUpdateEvent(
                      documentId: documentId,
                      name: nameController.text,
                      price: priceController.text));

                  Navigator.pop(context);
                },
                child: const Text('Update Data'))
          ],
        ),
      ),
    );
  }
}
