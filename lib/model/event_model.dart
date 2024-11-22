class EventModel {
  final String id;
  final String title;
  final String description;
  final String location;
  final String imagePath;
  final List<int> categoryIds; // Assuming categories are represented by IDs
  final String duration;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.imagePath,
    required this.categoryIds,
    required this.duration,
  });

  // Factory constructor to create an EventModel from Firestore data
  factory EventModel.fromFirestore(Map<String, dynamic> data, String id) {
    return EventModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      location: data['location'] ?? '',
      imagePath: data['imagePath'] ?? '',
      categoryIds: List<int>.from(data['categoryIds'] ?? []),
      duration: data['duration'] ?? '',
    );
  }
}
