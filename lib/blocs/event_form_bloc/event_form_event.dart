import 'package:local_events/model/event.dart';

abstract class EventFormEvent {}

class AddEvent extends EventFormEvent {
  final Event event;
  AddEvent(this.event);
}

class UpdateEvent extends EventFormEvent {
  final Event event;
  UpdateEvent(this.event);
}
