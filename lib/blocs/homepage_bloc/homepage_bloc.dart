// homepage_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_events/services/firebase_service.dart';
import 'homepage_event.dart';
import 'homepage_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final FirebaseService firebaseService;

  HomePageBloc(this.firebaseService) : super(HomePageInitial());

  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is LoadCategories) {
      yield HomePageLoading();
      try {
        final categories = await firebaseService.fetchCategories();
        final events =
            await firebaseService.fetchAllEvents(); // Optionally fetch events
        yield HomePageLoaded(
            categories, events, null); // Initialize with no selected category
      } catch (e) {
        yield HomePageError("Failed to load categories: ${e.toString()}");
      }
    } else if (event is LoadEventsForCategory) {
      yield HomePageLoading();
      try {
        // Implement filtering logic based on event.categoryId
        final events = await firebaseService
            .fetchAllEvents(); // Adjust this for category filtering if needed
        yield HomePageLoaded(
            [], events, event.categoryId); // Pass filtered events
      } catch (e) {
        yield HomePageError("Failed to load events: ${e.toString()}");
      }
    }
  }
}
