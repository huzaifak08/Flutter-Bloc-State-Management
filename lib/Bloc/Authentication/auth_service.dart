import 'package:firebase_auth/firebase_auth.dart';

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
  Future loginUser(String email, String password) async {
    try {
      (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // Sign Out:
}
