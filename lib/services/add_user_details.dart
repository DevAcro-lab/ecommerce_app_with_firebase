import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/models/user_details.dart';

Future<void> addUser({
  required UserDetails userDetails,
  required String id,
}) async {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference =
      firebaseFirestore.collection('users');

  await collectionReference.doc(id).set({
    'username': userDetails.username,
    'email': userDetails.email,
    'phoneNumber': userDetails.phoneNumber,
    'deliveryAddress': userDetails.deliveryAddress,
    'postalCode': userDetails.postalCode,
  });
}
