import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:local_events/model/event.dart';
import 'package:local_events/model/category.dart' as local_category; // Use an alias
import 'package:local_events/model/guest.dart';
import 'package:local_events/model/profile.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all events
  Future<List<Event>> fetchAllEvents() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('events').get();
      return snapshot.docs.map((doc) => Event.fromFirestore(doc)).toList();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching events: $e");
      }
      return [];
    }
  }

  // Fetch all categories
  Future<List<local_category.Category>> fetchCategories() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('categories').get();
      return snapshot.docs.map((doc) => local_category.Category.fromFirestore(doc)).toList(); // Use alias
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching categories: $e");
      }
      return [];
    }
  }

  // Fetch a specific event by ID
  Future<Event?> fetchEventById(String eventId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('events').doc(eventId).get();
      if (doc.exists) {
        return Event.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching event by ID: $e");
      }
      return null;
    }
  }

  // Add a new event
  Future<void> addEvent(Event event) async {
    try {
      await _firestore.collection('events').add({
        'name': event.title,
        'description': event.description,
        'date': event.date,
        'location': event.location,
        'categoryIds': event.categoryIds,
        // Add more fields as needed
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error adding event: $e");
      }
      rethrow; // Propagate the error for handling in the Bloc
    }
  }

  // Update an existing event
  Future<void> updateEvent(Event event) async {
    try {
      await _firestore.collection('events').doc(event.id).update({
        'name': event.title,
        'description': event.description,
        'date': event.date,
        'location': event.location,
        'categoryIds': event.categoryIds,
        // Add more fields as needed
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error updating event: $e");
      }
      rethrow; // Propagate the error for handling in the Bloc
    }
  }

  // Fetch a single event by ID (used in EventDetailBloc)
  Future<Event?> fetchEvent(String eventId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('events').doc(eventId).get();
      if (doc.exists) {
        return Event.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching event: $e");
      }
      return null;
    }
  }

  // Add a guest
  Future<void> addGuest(Guest guest) async {
    try {
      await _firestore.collection('guests').add({
        'name': guest.name,
        'email': guest.email,
        'imagePath': guest.imagePath,
        // Add more fields as needed
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error adding guest: $e");
      }
      rethrow; // Propagate the error for handling in the Bloc
    }
  }

  // Update a guest
  Future<void> updateGuest(Guest guest) async {
    try {
      await _firestore.collection('guests').doc(guest.id).update({
        'name': guest.name,
        'email': guest.email,
        'imagePath': guest.imagePath,
        // Add more fields as needed
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error updating guest: $e");
      }
      rethrow; // Propagate the error for handling in the Bloc
    }
  }

  // Fetch all guests
  Future<List<Guest>> fetchGuests() async {
    try {
      final snapshot = await _firestore.collection('guests').get();
      return snapshot.docs.map((doc) {
        return Guest.fromFirestore(doc.data(), doc.id);
      }).toList();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching guests: $e");
      }
      return [];
    }
  }

  // Update a profile
  Future<void> updateProfile(Profile profile) async {
    try {
      await _firestore.collection('profiles').doc(profile.id).update({
        'name': profile.name,
        'email': profile.email,
        'imagePath': profile.imagePath,
        // Add more fields as needed
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error updating profile: $e");
      }
      rethrow; // Propagate the error for handling in the Bloc
    }
  }

  // Fetch a profile by user ID
  Future<Profile?> fetchProfile(String userId) async {
    try {
      final doc = await _firestore.collection('profiles').doc(userId).get();
      if (doc.exists) {
        return Profile.fromFirestore(doc.data()!, doc.id);
      } else {
        return null; // Handle the case when the profile does not exist
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching profile: $e");
      }
      return null;
    }
  }
}
