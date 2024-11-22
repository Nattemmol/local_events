// guest_state.dart

import 'package:local_events/model/guest.dart';

abstract class GuestState {}

class GuestInitial extends GuestState {}

class GuestLoading extends GuestState {}

class GuestLoaded extends GuestState {
  final List<Guest> guests;

  GuestLoaded(this.guests);
}

class GuestError extends GuestState {
  final String message;

  GuestError(this.message);
}
