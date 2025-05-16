import 'dart:io';

import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';

class GetSlideScreen extends StatelessWidget {
  final String name;
  final String email;
  final String college;
  final String description;
  final File? image;

  const GetSlideScreen({
    super.key,
    required this.name,
    required this.email,
    required this.college,
    required this.description,
    this.image,
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
        child: ListView(
          children: [
            // الصورة
            Center(
              child: image != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  image!,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              )
                  : const Text('No image selected', style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 20),

            // بيانات المستخدم داخل Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
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
            ),
          ],
        ),
      ),
    );
  }
}
