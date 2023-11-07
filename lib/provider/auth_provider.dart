import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../models/user.dart';

class AuthProvider extends ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  bool isLoading = false;

  UserModel? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserModel(uid: user.uid, email: user.email!);
  }

  Stream<UserModel?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserModel?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    isLoading = true;
    notifyListeners();
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = false;
      notifyListeners();
      return _userFromFirebase(credentials.user);
    } catch (e) {
      isLoading = false;
      notifyListeners();
      throw Exception(e);
    }
  }

  Future<UserModel?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    isLoading = true;
    notifyListeners();
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = false;
      notifyListeners();
      print('Account created');
      return _userFromFirebase(credentials.user);
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('Exceptionnnnn');
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    isLoading = true;
    notifyListeners();
    final signOut = await _firebaseAuth.signOut();
    isLoading = false;
    notifyListeners();
    return signOut;
  }
}
