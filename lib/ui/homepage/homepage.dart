import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_events/blocs/homepage_bloc/homepage_bloc.dart';
import 'package:local_events/blocs/homepage_bloc/homepage_event.dart';
import 'package:local_events/blocs/homepage_bloc/homepage_state.dart';

import 'package:local_events/services/firebase_service.dart';
import 'package:local_events/styleguide.dart';
import 'package:local_events/ui/event_detail/event_details_page.dart';
import 'package:local_events/ui/homepage/category_widget.dart';
import 'package:local_events/ui/homepage/event_widget.dart';
import 'homepage_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(FirebaseService())..add(LoadCategories()),
      child: Scaffold(
        body: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            if (state is HomePageLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomePageLoaded) {
              return Stack(
                children: [
                  HomepageBackground(
                    screenHeight: MediaQuery.of(context).size.height,
                    key: const Key('homepage_background'),
                  ),
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Row(
                              children: [
                                Text("LOCAL EVENTS", style: fadedTextStyle),
                                Spacer(),
                                Icon(
                                  Icons.person_outline,
                                  color: Color(0x99FFFFFF),
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Text("What's Up", style: whiteHeadingTextStyle),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: state.categories
                                    .map((category) => CategoryWidget(category: category))
                                    .toList(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: state.events
                                  .map((event) => GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => EventDetailsPage(
                                            event: event,
                                            eventId: event.id, // Assuming 'event' has an 'id' property
                                          ),
                                        ),
                                      );
                                    },
                                    child: EventWidget(event: event),
                                  ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is HomePageError) {
              return Center(child: Text(state.message));
            }
            return Container(); // Default return
          },
        ),
      ),
    );
  }
}
