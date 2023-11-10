import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getProductIdByIndex(int index) async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('products');

  QuerySnapshot snapshot = await collectionReference.get();

  if (index < snapshot.docs.length) {
    DocumentSnapshot productDocument = snapshot.docs[index];
    String productId = productDocument.id;
    return productId;
  } else {
    throw Exception('Failed');
  }
}
