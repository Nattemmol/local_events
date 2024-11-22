import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String imagePath;
  final String title; // This serves as the "name" of the event
  final String description;
  final String location;
  final DateTime date; // Changed type to DateTime for easier handling
  final String duration;
  final String punchLine1;
  final String punchLine2;
  final List<int> categoryIds;
  final List<String> galleryImages;

  Event({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.duration,
    required this.punchLine1,
    required this.punchLine2,
    required this.categoryIds,
    required this.galleryImages,
  });

  // Factory constructor to create an Event from Firestore document
  factory Event.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Event(
      id: doc.id,
      imagePath: data['imagePath'] ?? '',
      title: data['title'] ?? '', // 'title' used instead of 'name'
      description: data['description'] ?? '',
      location: data['location'] ?? '',
      date: (data['date'] as Timestamp).toDate(), // Convert Timestamp to DateTime
      duration: data['duration'] ?? '',
      punchLine1: data['punchLine1'] ?? '',
      punchLine2: data['punchLine2'] ?? '',
      categoryIds: List<int>.from(data['categoryIds'] ?? []),
      galleryImages: List<String>.from(data['galleryImages'] ?? []),
    );
  }

  // Method to convert Event object to Firestore format
  Map<String, dynamic> toFirestore() {
    return {
      'imagePath': imagePath,
      'title': title, // Storing title as event name
      'description': description,
      'location': location,
      'date': Timestamp.fromDate(date), // Convert DateTime to Firestore Timestamp
      'duration': duration,
      'punchLine1': punchLine1,
      'punchLine2': punchLine2,
      'categoryIds': categoryIds,
      'galleryImages': galleryImages,
    };
  }
}
