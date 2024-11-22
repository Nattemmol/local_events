import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class User {
  final String id;
  final String email;
  final String? displayName;

  User({
    required this.id,
    required this.email,
    this.displayName,
  });

  // Factory method to create a User instance from Firebase user
  factory User.fromFirebaseUser(firebase_auth.User firebaseUser) {
    return User(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      displayName: firebaseUser.displayName,
    );
  }

  // Convert User instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
    };
  }

  // Empty user instance
  static User get empty => User(
        id: '',
        email: '',
        displayName: null,
      );

  // CopyWith method to create a new instance with modified fields
  User copyWith({
    String? id,
    String? email,
    String? displayName,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
    );
  }
}
