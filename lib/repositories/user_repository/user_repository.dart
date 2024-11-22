import 'package:cloud_firestore/cloud_firestore.dart'; // Required for Firestore
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:local_events/repositories/user_repository/user_model.dart';

class UserRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  UserRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  // Stream to listen to authentication state changes
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) return null;
      return User.fromFirebaseUser(firebaseUser);
    });
  }

  // Sign up a new user
  Future<User> signUp(User user, {
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final user = await signUpWithEmailAndPassword(
        email: email,
        password: password,
        displayName: displayName,
      );
      if (user == null) throw Exception('Failed to sign up.');
      return user;
    } catch (e) {
      throw Exception('Sign-up process failed: $e');
    }
  }

  // Store user data in Firestore
  Future<void> setUserData(User user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toMap());
    } catch (e) {
      throw Exception('Failed to store user data: $e');
    }
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = credential.user;
      if (firebaseUser != null) {
        return User.fromFirebaseUser(firebaseUser);
      } else {
        throw Exception('No user found in credentials.');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception('Sign in failed: ${e.message} (code: ${e.code})');
    } catch (e) {
      throw Exception('Unexpected error during sign-in: $e');
    }
  }

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = credential.user;
      if (firebaseUser != null) {
        if (displayName != null) {
          await firebaseUser.updateDisplayName(displayName);
        }
        return User.fromFirebaseUser(firebaseUser);
      } else {
        throw Exception('No user found in credentials.');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception('Sign-up failed: ${e.message} (code: ${e.code})');
    } catch (e) {
      throw Exception('Unexpected error during sign-up: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  // Get the currently signed-in user
  User? get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser != null ? User.fromFirebaseUser(firebaseUser) : null;
  }
}
