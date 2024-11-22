import 'package:local_events/model/event.dart';

abstract class EventDetailState {}

class EventDetailInitial extends EventDetailState {}

class EventDetailLoading extends EventDetailState {}

class EventDetailLoaded extends EventDetailState {
  final Event event;
  EventDetailLoaded({required this.event});
}

class EventDetailError extends EventDetailState {
  final String message;
  EventDetailError({required this.message});
}
