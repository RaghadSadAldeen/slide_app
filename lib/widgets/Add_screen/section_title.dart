import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: darkTeal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
