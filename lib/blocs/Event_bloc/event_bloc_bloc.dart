import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_events/model/event.dart';
import 'event_bloc_event.dart';
import 'event_bloc_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final FirebaseFirestore firestore;

  EventBloc({required this.firestore}) : super(EventLoading()) {
    on<LoadEvents>(_onLoadEvents);
  }

  Future<void> _onLoadEvents(LoadEvents event, Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      final querySnapshot = await firestore.collection('events').get();
      final events = querySnapshot.docs.map((doc) => Event.fromFirestore(doc)).toList();
      emit(EventLoaded(events: events));
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }
}
