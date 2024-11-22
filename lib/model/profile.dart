// profile.dart
class Profile {
  final String id;
  final String name;
  final String email;
  final String imagePath; // Assuming profile image path

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.imagePath,
  });

  factory Profile.fromFirestore(Map<String, dynamic> data, String id) {
    return Profile(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      imagePath: data['imagePath'] ?? '',
    );
  }
}
