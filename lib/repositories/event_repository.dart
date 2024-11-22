import 'package:local_events/model/event.dart';
import 'package:local_events/services/firebase_service.dart';

class EventRepository {
  final FirebaseService _firebaseService;

  EventRepository(this._firebaseService);

  // Fetch all events
  Future<List<Event>> fetchAllEvents() async {
    return await _firebaseService.fetchAllEvents();
  }

  // Fetch a specific event by ID
  Future<Event?> fetchEventById(String eventId) async {
    return await _firebaseService.fetchEventById(eventId);
  }
}
