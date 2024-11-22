abstract class EventFormState {}

class EventFormInitial extends EventFormState {}

class EventFormLoading extends EventFormState {}

class EventFormSuccess extends EventFormState {}

class EventFormError extends EventFormState {
  final String message;
  EventFormError({required this.message});
}
