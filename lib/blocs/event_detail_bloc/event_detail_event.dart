abstract class EventDetailEvent {}

class FetchEventDetails extends EventDetailEvent {
  final String eventId;
  FetchEventDetails(this.eventId);
}
