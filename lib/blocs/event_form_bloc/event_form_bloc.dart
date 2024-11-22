import 'package:flutter_bloc/flutter_bloc.dart';
import 'event_form_event.dart';
import 'event_form_state.dart';
import 'package:local_events/services/firebase_service.dart';

class EventFormBloc extends Bloc<EventFormEvent, EventFormState> {
  final FirebaseService firebaseService;

  EventFormBloc(this.firebaseService) : super(EventFormInitial());

  Stream<EventFormState> mapEventToState(EventFormEvent event) async* {
    if (event is AddEvent) {
      yield EventFormLoading();
      try {
        await firebaseService.addEvent(event.event);
        yield EventFormSuccess();
      } catch (e) {
        yield EventFormError(message: e.toString());
      }
    } else if (event is UpdateEvent) {
      yield EventFormLoading();
      try {
        await firebaseService.updateEvent(event.event);
        yield EventFormSuccess();
      } catch (e) {
        yield EventFormError(message: e.toString());
      }
    }
  }
}
