import 'package:flutter/material.dart';
import 'package:local_events/model/event.dart';
import 'package:local_events/styleguide.dart';


class EventDetailsContent extends StatelessWidget {
  final Event event;

  const EventDetailsContent({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: Text(
              event.title,
              style: eventWhiteTitleTextStyle,
            ),
          ),
          // Add other widgets as needed, like the location, description, etc.
        ],
      ),
    );
  }
}
