// lib/widgets/text_profile.dart
import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart'; // تأكد أن تحتوي على colors مثل darkTeal, deepForestGreen

class TextProfile extends StatelessWidget {
  final String name;
  final String major;
  final String email;
  final String phone;

  const TextProfile({
    super.key,
    required this.name,
    required this.major,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          major,
          style: const TextStyle(color: Colors.white70),
        ),
        Text(
          email,
          style: const TextStyle(color: Colors.white70),
        ),
        Text(
          phone,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}

// ويدجت جديدة لعنوان الصفحة
class ProfileTitle extends StatelessWidget {
  const ProfileTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Profile',
      style: TextStyle(
        color: whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }
}
