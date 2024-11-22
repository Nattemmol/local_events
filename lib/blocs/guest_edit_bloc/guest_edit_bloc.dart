import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_events/blocs/guest_bloc/guest_bloc_event.dart'; // Ensure proper import
import 'package:local_events/blocs/guest_bloc/guest_bloc_state.dart';
import 'package:local_events/services/firebase_service.dart';

class GuestEditBloc extends Bloc<GuestEvent, GuestState> {
  final FirebaseService firebaseService;

  GuestEditBloc(this.firebaseService) : super(GuestInitial());

  Stream<GuestState> mapEventToState(GuestEvent event) async* {
    if (event is AddGuest) {
      yield GuestLoading();
      try {
        await firebaseService.addGuest(event.guest);
        yield GuestLoaded(await firebaseService.fetchGuests()); // Fetch updated list
      } catch (e) {
        yield GuestError("Failed to add guest: ${e.toString()}");
      }
    } else if (event is UpdateGuest) {
      yield GuestLoading();
      try {
        await firebaseService.updateGuest(event.guest);
        yield GuestLoaded(await firebaseService.fetchGuests()); // Fetch updated list
      } catch (e) {
        yield GuestError("Failed to update guest: ${e.toString()}");
      }
    } else if (event is FetchGuests) {
      yield GuestLoading();
      try {
        final guests = await firebaseService.fetchGuests();
        yield GuestLoaded(guests);
      } catch (e) {
        yield GuestError("Failed to fetch guests: ${e.toString()}");
      }
    }
  }
}
