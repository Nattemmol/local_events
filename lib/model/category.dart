import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String id;  // Using String to accommodate Firestore document IDs
  final String name;
  final IconData icon;

  Category({
    required this.id,
    required this.name,
    required this.icon,
  });

  // Factory method to create a Category from Firestore document
  factory Category.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Category(
      id: doc.id,
      name: data['name'] ?? 'Unnamed Category',  // Default name if none found
      icon: data['icon'] != null ? IconData(data['icon']) : Icons.category,  // Default icon
    );
  }
}

// Function to fetch categories from Firestore
Future<List<Category>> fetchCategories() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    QuerySnapshot snapshot = await firestore.collection('categories').get();
    return snapshot.docs.map((doc) => Category.fromFirestore(doc)).toList();
  } catch (e) {
    if (kDebugMode) {
      print("Error fetching categories: $e");
    }
    return []; // Return an empty list on error
  }
}

// Define some default categories locally (optional)
final allCategory = Category(
  id: 'all',  // Use a string ID for consistency
  name: 'All',
  icon: Icons.search,
);

// You can keep some hardcoded categories if needed
final List<Category> defaultCategories = [
  allCategory,
  Category(id: 'music', name: 'Music', icon: Icons.music_note),
  Category(id: 'meetup', name: 'MeetUp', icon: Icons.location_on),
  Category(id: 'golf', name: 'Golf', icon: Icons.golf_course),
  Category(id: 'birthday', name: 'Birthday', icon: Icons.cake),
];
