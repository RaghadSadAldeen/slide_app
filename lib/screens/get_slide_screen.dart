import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';


class GetSlideScreen extends StatelessWidget {
  final String name;
  final String email;
  final String college;
  final String description;

  const GetSlideScreen({
    super.key,
    required this.name,
    required this.email,
    required this.college,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide Details'),
        backgroundColor: darkTeal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Email: $email', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('College: $college', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Description: $description', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
