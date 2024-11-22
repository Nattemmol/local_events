import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_events/blocs/guest_bloc/guest_bloc_bloc.dart';
import 'package:local_events/blocs/guest_bloc/guest_bloc_state.dart';

class GuestListContent extends StatelessWidget {
  const GuestListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuestBloc, GuestState>(
      builder: (context, state) {
        if (state is GuestLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GuestLoaded) {
          return ListView.builder(
            itemCount: state.guests.length,
            itemBuilder: (context, index) {
              final guest = state.guests[index];
              return ListTile(
                leading: Image.asset(guest.imagePath), // Assuming imagePath is available
                title: Text(guest.name),
                subtitle: Text(guest.email),
              );
            },
          );
        } else if (state is GuestError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text("No guests available"));
        }
      },
    );
  }
}
