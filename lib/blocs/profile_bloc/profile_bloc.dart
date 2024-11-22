import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_events/blocs/profile_bloc/profile_event.dart';
import 'package:local_events/blocs/profile_bloc/profile_state.dart';
import 'package:local_events/services/firebase_service.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseService firebaseService;

  ProfileBloc(this.firebaseService) : super(ProfileInitial());

  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfile) {
      yield ProfileLoading();
      try {
        final profile = await firebaseService.fetchProfile(event.userId);
        if (profile != null) {
          yield ProfileLoaded(profile: profile);
        } else {
          yield ProfileError(message: 'Profile not found'); // Handle the case where profile is null
        }
      } catch (e) {
        yield ProfileError(message: e.toString());
      }
    } else if (event is UpdateProfile) {
      yield ProfileLoading();
      try {
        await firebaseService.updateProfile(event.profile);
        yield ProfileLoaded(profile: event.profile); // This should always be non-null
      } catch (e) {
        yield ProfileError(message: e.toString());
      }
    }
  }
}
