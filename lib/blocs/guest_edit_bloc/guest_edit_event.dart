import 'package:equatable/equatable.dart';
import 'package:local_events/model/guest.dart';

abstract class GuestEvent extends Equatable {
  const GuestEvent();

  @override
  List<Object> get props => [];
}

class AddGuest extends GuestEvent {
  final Guest guest;

  const AddGuest(this.guest);

  @override
  List<Object> get props => [guest];
}

class UpdateGuest extends GuestEvent {
  final Guest guest;

  const UpdateGuest(this.guest);

  @override
  List<Object> get props => [guest];
}
