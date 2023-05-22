import 'package:bloc_statemanagement/Firestore/create_data_screen.dart';
import 'package:bloc_statemanagement/Firestore/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadDataScreen extends StatefulWidget {
  const ReadDataScreen({super.key});

  @override
  State<ReadDataScreen> createState() => _ReadDataScreenState();
}

class _ReadDataScreenState extends State<ReadDataScreen> {
  @override
  void initState() {
    super.initState();
    final dataBloc = BlocProvider.of<DataBloc>(context);
    dataBloc.add(DataReadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Data Bloc')),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is DataReadState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                debugPrint(state.data[index].name);
                return ListTile(
                  title: Text(state.data[index].name),
                  subtitle: Text(state.data[index].price),
                );
              },
            );
          } else {
            return Text('Some Error');
          }
        },
      ),
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
