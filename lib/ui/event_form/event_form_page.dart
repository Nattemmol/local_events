import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_events/blocs/event_form_bloc/event_form_bloc.dart';
import 'package:local_events/blocs/event_form_bloc/event_form_event.dart';
import 'package:local_events/model/event.dart'; // Corrected import for Event model

class EventFormPage extends StatelessWidget {
  final Event? event; // Allow passing an existing event for editing

  const EventFormPage({super.key, this.event});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: event?.title ?? '');
    final descriptionController = TextEditingController(text: event?.description ?? '');
    // Add more controllers for other fields like time, guests, etc.

    return Scaffold(
      appBar: AppBar(
        title: Text(event == null ? 'Add Event' : 'Edit Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Event Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            // Add more input fields as needed

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newEvent = Event(
                  id: event?.id ?? '', // If editing, keep the existing ID
                  title: titleController.text,
                  description: descriptionController.text,
                  imagePath: '',
                  location: '',
                  duration: '',
                  punchLine1: '',
                  punchLine2: '',
                  categoryIds: [],
                  galleryImages: [],
                  date: DateTime(2021),
                  // Add more fields as needed
                );

                if (event == null) {
                  BlocProvider.of<EventFormBloc>(context).add(AddEvent(newEvent)); // Corrected Bloc reference
                } else {
                  BlocProvider.of<EventFormBloc>(context).add(UpdateEvent(newEvent)); // Corrected Bloc reference
                }

                Navigator.of(context).pop(); // Go back after saving
              },
              child: Text(event == null ? 'Create Event' : 'Update Event'),
            ),
          ],
        ),
      ),
    );
  }
}
