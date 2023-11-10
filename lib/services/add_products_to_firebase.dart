import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

Future<void> addProductsToFirebase(List<Product> products) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference productsCollection =
      firestore.collection('products');

  for (Product product in products) {
    final existingProduct = await productsCollection
        .where('title', isEqualTo: product.title)
        .where('brand', isEqualTo: product.brand)
        .get();
    if (existingProduct.docs.isEmpty) {
      final docId = productsCollection.doc().id;
      await productsCollection.add(
        {
          'id': docId,
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'discountPercentage': product.discountPercentage,
          'rating': product.rating,
          'stock': product.stock,
          'brand': product.brand,
          'category': product.category,
          'thumbnail': product.thumbnail,
          'images': product.images,
        },
      );
    }
  }
}
