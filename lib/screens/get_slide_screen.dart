import 'package:flutter/material.dart';
import '../constants/colors.dart';

class GetSlideScreen extends StatelessWidget {
  const GetSlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Slide'),
        backgroundColor: darkTeal,
        foregroundColor: whiteColor,
      ),
      body: const Center(
        child: Text(
          'This is the Get Slide page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
