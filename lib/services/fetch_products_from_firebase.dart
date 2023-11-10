import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/models/product.dart';

Future<List<Product>> fetchProductsFromFirebase() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final QuerySnapshot snapshot = await firestore.collection('products').get();

  final List<Product> productsList = snapshot.docs
      .map((DocumentSnapshot doc) =>
          Product.fromJson(doc.data() as Map<String, dynamic>))
      .toList();
  return productsList;
}
