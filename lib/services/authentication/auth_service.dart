import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  //instance of Auth to know whethear user is logged in or not
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //User sign in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      //sign in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }
}
