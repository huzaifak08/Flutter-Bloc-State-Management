import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference blocProductCollection =
      FirebaseFirestore.instance.collection('bloc_products');

  Future<void> saveDataToFirestore(String name, String price) async {
    await blocProductCollection.add({
      'name': name,
      'price': price,
    });
  }
}
