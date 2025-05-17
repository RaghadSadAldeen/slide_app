import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:slide_app/screens/get_slide_screen.dart'; // تم ربط الملف الجديد هنا

class AddSlideScreen extends StatefulWidget {
  const AddSlideScreen({Key? key}) : super(key: key);

  @override
  _AddSlideScreenState createState() => _AddSlideScreenState();
}

class _AddSlideScreenState extends State<AddSlideScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,

      appBar: AppBar(
        title: const Text(
          'Add Slide',
          style: TextStyle(color: whiteColor),
        ),
        backgroundColor: darkTeal,
        centerTitle: true,
        iconTheme: const IconThemeData(color: whiteColor),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: warmBeige,
                    child: Icon(Icons.person, color: blackColor),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Raghad S.",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              _buildTextField("Name"),
              _buildTextField("Email"),
              _buildTextField("College"),
              _buildTextField("Description", maxLines: 3),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GetSlideScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkTeal,
                    foregroundColor: whiteColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: (value) =>
        value == null || value.isEmpty ? 'Required field' : null,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: blackColor),
          filled: true,
          fillColor: sageGreen.withOpacity(0.4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: deepForestGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: darkTeal, width: 2),
          ),
        ),
      ),
    );
  }
}
