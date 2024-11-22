import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_events/blocs/event_detail_bloc/event_detail_bloc.dart';
import 'package:local_events/blocs/event_detail_bloc/event_detail_event.dart';
import 'package:local_events/blocs/event_detail_bloc/event_detail_state.dart';
import 'package:local_events/ui/event_detail/event_details_content.dart';
import 'package:local_events/services/firebase_service.dart';
import 'event_detail_background.dart';

class EventDetailsPage extends StatelessWidget {
  final String eventId;

  const EventDetailsPage({super.key, required this.eventId, required event});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventDetailBloc(FirebaseService())..add(FetchEventDetails(eventId)),
      child: Scaffold(
        body: BlocBuilder<EventDetailBloc, EventDetailState>(
          builder: (context, state) {
            if (state is EventDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EventDetailLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  EventDetailsBackground(event: state.event),
                  EventDetailsContent(event: state.event),
                ],
              );
            } else if (state is EventDetailError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text("No data available"));
            }
          },
        ),
      ),
    );
  }
}
