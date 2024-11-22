import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/guest.dart';

class GuestRepository {
  final FirebaseFirestore _firestore;

  GuestRepository(this._firestore);

  // Fetch all guests from Firestore
  Future<List<Guest>> fetchGuests() async {
    final snapshot = await _firestore.collection('guests').get();
    return snapshot.docs.map((doc) => Guest.fromFirestore(doc.data(), doc.id)).toList();
  }

  // Add a guest to Firestore
  Future<void> addGuest(Guest guest) async {
    await _firestore.collection('guests').add(guest.toMap());
  }

  // Update a guest in Firestore
  Future<void> updateGuest(Guest guest) async {
    await _firestore.collection('guests').doc(guest.id).update(guest.toMap());
  }
}
