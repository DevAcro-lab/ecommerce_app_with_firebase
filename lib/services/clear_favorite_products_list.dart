import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> clearFavoriteProductsListFromFirestore() async {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  QuerySnapshot snapshot = await firebaseFirestore
      .collection("users")
      .doc(userId)
      .collection("favorite")
      .get();
  for (QueryDocumentSnapshot queryDocumentSnapshot in snapshot.docs) {
    await queryDocumentSnapshot.reference.delete();
  }
}
