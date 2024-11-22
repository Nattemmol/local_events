import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_events/blocs/guest_bloc/guest_bloc_event.dart';
import 'package:local_events/blocs/guest_bloc/guest_bloc_state.dart';
import 'package:local_events/repositories/guest_repository.dart';

// Create the GuestBloc
class GuestBloc extends Bloc<GuestEvent, GuestState> {
  final GuestRepository guestRepository;

  GuestBloc(this.guestRepository) : super(GuestInitial());

  Stream<GuestState> mapEventToState(GuestEvent event) async* {
    if (event is FetchGuests) {
      yield GuestLoading();
      try {
        final guests = await guestRepository.fetchGuests();
        yield GuestLoaded(guests);
      } catch (e) {
        yield GuestError("Failed to fetch guests: ${e.toString()}");
      }
    } else if (event is AddGuest) {
      yield GuestLoading();
      try {
        await guestRepository.addGuest(event.guest);
        yield* mapEventToState(FetchGuests()); // Refresh guests after adding
      } catch (e) {
        yield GuestError("Failed to add guest: ${e.toString()}");
      }
    } else if (event is UpdateGuest) {
      yield GuestLoading();
      try {
        await guestRepository.updateGuest(event.guest);
        yield* mapEventToState(FetchGuests()); // Refresh guests after updating
      } catch (e) {
        yield GuestError("Failed to update guest: ${e.toString()}");
      }
    }
  }
}
