import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/models/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> removeFromFirebase(Product product, context) async {
  try {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId != null && userId.isNotEmpty) {
      CollectionReference collectionReference = firebaseFirestore
          .collection("users")
          .doc(userId)
          .collection("favorite");

      print("REMOVED");
      await collectionReference.doc(product.id).delete();

      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: lightGreyColor.withOpacity(0.7),
          content: const Row(
            children: [
              Icon(
                Icons.favorite_border_outlined,
                color: whiteColor,
              ),
              SizedBox(width: 4),
              Text('Removed from Favorite'),
            ],
          ),
        ),
      );
    } else {
      print("User ID is empty");
    }
  } catch (error) {
    print("Error removing product from Firebase: $error");
    rethrow;
  }
}
