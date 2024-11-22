// homepage_event.dart
abstract class HomePageEvent {}

class LoadCategories extends HomePageEvent {}

class LoadEventsForCategory extends HomePageEvent {
  final String? categoryId;

  LoadEventsForCategory(this.categoryId);
}
