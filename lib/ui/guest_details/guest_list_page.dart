import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_events/blocs/guest_bloc/guest_bloc_bloc.dart';
import 'package:local_events/blocs/guest_bloc/guest_bloc_event.dart';
import 'package:local_events/repositories/guest_repository.dart';
import 'guest_list_background.dart';
import 'guest_list_content.dart';

class GuestListPage extends StatelessWidget {
  final GuestRepository guestRepository;

  const GuestListPage({super.key, required this.guestRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GuestBloc(guestRepository)..add(FetchGuests()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Guests')),
        body: Stack(
          children: [
            GuestListBackground(screenHeight: MediaQuery.of(context).size.height),
            const SafeArea(
              child: GuestListContent(),
            ),
          ],
        ),
      ),
    );
  }
}
