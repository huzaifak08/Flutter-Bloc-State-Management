import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  final String documentId;
  final String name;
  final String price;

  DataModel(
      {required this.documentId, required this.name, required this.price});

  factory DataModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    return DataModel(
      documentId: snapshot.id,
      name: data!['name'] ?? '',
      price: data['price'] ?? '',
    );
  }
}
