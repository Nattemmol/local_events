import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      if (kDebugMode) {
        print("Error in sign-up: $e");
      }
      return null;
    }
  }

  // Sign in with email and password
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      if (kDebugMode) {
        print("Error in sign-in: $e");
      }
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print("Error signing out: $e");
      }
    }
  }

  // Get current user
  User? get currentUser {
    return _auth.currentUser;
  }

  // Stream for auth state changes
  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }
}
