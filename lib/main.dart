import 'package:flutter/material.dart';
import 'package:slide_app/screens/add_slide_screen.dart'; // الصفحة الرئيسية

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AddSlideScreen(), // أول صفحة بتفتح
    );
  }
}
