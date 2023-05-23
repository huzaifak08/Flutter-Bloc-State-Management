import 'package:bloc_statemanagement/Firestore/data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference blocProductCollection =
      FirebaseFirestore.instance.collection('bloc_products');

  // Save Data:
  Future<void> saveDataToFirestore(String name, String price) async {
    await blocProductCollection.add({
      'name': name,
      'price': price,
    });
  }

  // Read Data:
  Future<List<DataModel>> getData() async {
    QuerySnapshot querySnapshot = await blocProductCollection.get();
    List<DataModel> dataList = [];

    for (var doc in querySnapshot.docs) {
      DataModel data = DataModel.fromSnapshot(doc);
      dataList.add(data);
    }

    return dataList;
  }

  // Delete Data:
  Future<void> deleteData(String docId) async {
    await blocProductCollection.doc(docId).delete();
  }
}
