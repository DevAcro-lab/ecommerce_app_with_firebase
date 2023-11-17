import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/models/product.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<Product>> fetchFavoriteProducts() async {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final QuerySnapshot snapshot = await firebaseFirestore
      .collection("users")
      .doc(userId)
      .collection("favorite")
      .get();

  final List<Product> favProducts = snapshot.docs
      .map((DocumentSnapshot documentSnapshot) =>
          Product.fromJson(documentSnapshot.data() as Map<String, dynamic>))
      .toList();
  return favProducts;
}
