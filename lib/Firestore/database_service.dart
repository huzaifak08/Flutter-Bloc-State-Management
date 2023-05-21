import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference blocProductCollection =
      FirebaseFirestore.instance.collection('bloc_products');

  Future saveDataToFirestore(String name, String price) async {
    return await blocProductCollection.add({
      'name': name,
      'price': price,
    });
  }
}
