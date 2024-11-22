import 'package:flutter_bloc/flutter_bloc.dart';
import 'event_detail_event.dart';
import 'event_detail_state.dart';
import 'package:local_events/services/firebase_service.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {
  final FirebaseService firebaseService;

  EventDetailBloc(this.firebaseService) : super(EventDetailInitial());

  Stream<EventDetailState> mapEventToState(EventDetailEvent event) async* {
    if (event is FetchEventDetails) {
      yield EventDetailLoading();
      try {
        final eventDetails = await firebaseService.fetchEvent(event.eventId);
        if (eventDetails == null) {
          // If eventDetails is null, yield an error state
          yield EventDetailError(message: "Event not found");
        } else {
          // Only yield EventDetailLoaded if eventDetails is non-null
          yield EventDetailLoaded(event: eventDetails);
        }
      } catch (e) {
        yield EventDetailError(message: e.toString());
      }
    }
  }
}
