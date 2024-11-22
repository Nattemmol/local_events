import 'package:flutter/material.dart';
import 'package:local_events/model/event.dart';
import 'package:local_events/styleguide.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20),
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Image.asset(
                event.imagePath,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(event.title, style: eventTitleTextStyle),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 5),
                            Text(
                              event.location,
                              style: eventLocationTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      event.duration.toUpperCase(),
                      textAlign: TextAlign.right,
                      style: eventLocationTextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
