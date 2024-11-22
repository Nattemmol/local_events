import 'package:equatable/equatable.dart';
import 'package:local_events/model/event.dart';


abstract class EventState extends Equatable {

  @override
  List<Object?> get props => [];
}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final List<Event> events;

  EventLoaded({required this.events});
}

class EventError extends EventState {
  final String message;

  EventError({required this.message});
}
