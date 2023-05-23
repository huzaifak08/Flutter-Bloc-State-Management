import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;

  // Register:
  Future registerUser(String email, String password) async {
    try {
      (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // Login:

  // Sign Out:
}
