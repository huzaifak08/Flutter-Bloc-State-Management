import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  final String name;
  final String price;

  DataModel({required this.name, required this.price});

  factory DataModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    return DataModel(
      name: data!['name'] ?? '',
      price: data['price'] ?? '',
    );
  }
}
