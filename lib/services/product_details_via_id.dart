import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

Future<Product?> productDetailsViaID(String productId) async {
  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  try {
    QuerySnapshot querySnapshot =
        await productsCollection.where('id', isEqualTo: productId).get();

    if (querySnapshot.docs.isNotEmpty) {
      return Product.fromJson(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  } catch (e) {
    print('Error fetching product by id $e');
    return null;
  }
}
