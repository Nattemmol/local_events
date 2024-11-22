// guest_bloc_event.dart
import 'package:local_events/model/guest.dart';

abstract class GuestEvent {}

class FetchGuests extends GuestEvent {}

class AddGuest extends GuestEvent {
  final Guest guest;

  AddGuest(this.guest);
}

class UpdateGuest extends GuestEvent {
  final Guest guest;

  UpdateGuest(this.guest);
}
