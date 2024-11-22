class Guest {
  final String id;
  final String name;
  final String email; // Assuming guests have emails
  final String imagePath; // Path for the guest image

  Guest({
    required this.id,
    required this.name,
    required this.email,
    required this.imagePath,
  });

  // Factory constructor for creating Guest from Firestore data
  factory Guest.fromFirestore(Map<String, dynamic> data, String id) {
    return Guest(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      imagePath: data['imagePath'] ?? '', // Dynamic image path from Firestore
    );
  }

  // Convert a Guest object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'imagePath': imagePath,
    };
  }
}
