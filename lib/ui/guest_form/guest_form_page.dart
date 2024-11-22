import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Ensure it's pointing to the correct GuestBloc
import 'package:local_events/blocs/guest_bloc/guest_bloc_bloc.dart';
// ignore: library_prefixes
import 'package:local_events/blocs/guest_bloc/guest_bloc_event.dart' as guestBlocEvent; // Use alias for guest_bloc_event
// ignore: library_prefixes
import 'package:local_events/blocs/guest_edit_bloc/guest_edit_event.dart' as guestEditEvent; // Use alias for guest_edit_event
import 'package:local_events/model/guest.dart';
class GuestFormPage extends StatelessWidget {
  final Guest? guest; // Allow passing an existing guest for editing

  const GuestFormPage({super.key, this.guest});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: guest?.name ?? '');
    final emailController = TextEditingController(text: guest?.email ?? '');
    // Add more controllers as needed

    return Scaffold(
      appBar: AppBar(
        title: Text(guest == null ? 'Add Guest' : 'Edit Guest'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Guest Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            // Add more input fields as needed

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newGuest = Guest(
                  id: guest?.id ?? '', // If editing, keep the existing ID
                  name: nameController.text,
                  email: emailController.text,
                  imagePath: '',
                  // Add more fields as needed
                );

                if (guest == null) {
                  // Use the alias for AddGuest
                  BlocProvider.of<GuestBloc>(context).add(guestBlocEvent.AddGuest(newGuest));
                } else {
                  // Use the alias for UpdateGuest
                  BlocProvider.of<GuestBloc>(context).add(guestEditEvent.UpdateGuest(newGuest) as guestBlocEvent.GuestEvent);
                }

                Navigator.of(context).pop(); // Go back after saving
              },
              child: Text(guest == null ? 'Create Guest' : 'Update Guest'),
            ),
          ],
        ),
      ),
    );
  }
}
