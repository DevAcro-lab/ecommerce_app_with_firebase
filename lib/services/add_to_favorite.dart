import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/constants/colors.dart';
import 'package:ecommerce_app_with_firebase/models/product.dart';
import 'package:ecommerce_app_with_firebase/services/fetch_products_from_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> addToFavorite(Product product, context) async {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  List<Product> products = await fetchProductsFromFirebase();
  try {
    if (userId.isNotEmpty) {
      CollectionReference collectionReference = firebaseFirestore
          .collection('users')
          .doc(userId)
          .collection('favorite');
      //
      // Product productToAdd =
      //     products.firstWhere((product) => product.id == product.id);
      await collectionReference.doc(product.id).set(
        {
          'id': product.id,
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
      print("Added");
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: lightGreyColor.withOpacity(0.7),
          content: const Row(
            children: [
              Icon(
                Icons.favorite,
                color: whiteColor,
              ),
              SizedBox(width: 4),
              Text('Added to Favorite'),
            ],
          ),
        ),
      );
    } else {
      print('Product not found with ID: ${product.id}');
    }
  } catch (e) {
    throw Exception('FAILED TO ADD! $e');
  }
}
