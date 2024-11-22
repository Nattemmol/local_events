// homepage_state.dart
import 'package:local_events/model/category.dart';
import 'package:local_events/model/event.dart';

abstract class HomePageState {
  String? get selectedCategoryId; // Ensure this getter is present in the abstract class
}

class HomePageInitial extends HomePageState {
  @override
  String? get selectedCategoryId => null;
}

class HomePageLoading extends HomePageState {
  @override
  String? get selectedCategoryId => null;
}

class HomePageLoaded extends HomePageState {
  final List<Category> categories;
  final List<Event> events;
  @override
  final String? selectedCategoryId;

  HomePageLoaded(this.categories, this.events, this.selectedCategoryId);
}

class HomePageError extends HomePageState {
  final String message;

  HomePageError(this.message);

  @override
  String? get selectedCategoryId => null; // Provide implementation
}
