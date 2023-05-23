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
    final dataBloc = BlocProvider.of<DataBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Data Bloc')),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is DataReadState) {
            if (state.data.isEmpty) {
              return Text('No Data Available');
            } else {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  // debugPrint(state.data[index].name);
                  return ListTile(
                    onTap: () {},
                    title: Text(state.data[index].name),
                    subtitle: Text(state.data[index].price),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        dataBloc.add(DataDeleteEvent(
                            documentId: state.data[index].documentId));
                      },
                    ),
                  );
                },
              );
            }
          } else if (state is DataLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DataDeleteState) {
            dataBloc.add(DataReadEvent());
            return const Text('Data Deleted');
          } else if (state is DataErrorState) {
            return Text('Some Error:${state.error}');
          } else {
            return const Text('Some Serious Error');
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
