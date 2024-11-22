import 'package:flutter/material.dart';

class GuestListBackground extends StatelessWidget {
  final double screenHeight;

  const GuestListBackground({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      height: screenHeight * 0.3, // Adjust height as needed
      decoration: BoxDecoration(
        color: themeData.primaryColor,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
    );
  }
}
