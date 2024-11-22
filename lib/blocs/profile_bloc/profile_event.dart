import 'package:local_events/model/profile.dart';

abstract class ProfileEvent {}

class FetchProfile extends ProfileEvent {
  final String userId;
  FetchProfile(this.userId);
}

class UpdateProfile extends ProfileEvent {
  final Profile profile;
  UpdateProfile(this.profile);
}
