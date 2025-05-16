import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:slide_app/constants/colors.dart';
import 'package:slide_app/widgets/Add_screen/custom_text_field.dart';
import 'package:slide_app/widgets/Add_screen/image_picker_box.dart';
import 'package:slide_app/widgets/Add_screen/profile_row.dart';
import 'package:slide_app/widgets/Add_screen/section_title.dart';
import 'package:slide_app/constants/custom_bottom_nav_bar.dart';

import 'get_slide_screen.dart';

class AddSlideScreen extends StatefulWidget {
  const AddSlideScreen({super.key});
  @override
  State<AddSlideScreen> createState() => _AddSlideScreenState();
}

class _AddSlideScreenState extends State<AddSlideScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  File? _selectedImage;
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    collegeController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            children: [
              const SectionTitle(title: 'Add Slide'),
              const ProfileRow(name: 'Raghad S.', imageUrl: 'https://hiragate.com/wp-content/uploads/2017/07/73.jpg'),
              const SizedBox(height: 50),

              CustomTextField(label: 'Name', controller: nameController),
              const SizedBox(height: 3),
              CustomTextField(label: 'Email', controller: emailController),
              const SizedBox(height: 3),
              CustomTextField(label: 'College:', controller: collegeController),
              const SizedBox(height: 3),
              CustomTextField(label: 'Description:', controller: descController),
              const SizedBox(height: 10),

              ImagePickerBox(selectedImage: _selectedImage, onTap: _pickImage),
              const SizedBox(height: 50),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkTeal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (!_isValidEmail(emailController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a valid email address")),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GetSlideScreen(
                        name: nameController.text,
                        email: emailController.text,
                        college: collegeController.text,
                        description: descController.text,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),


      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/notifications');
          } else if (index == 2) {
            // نفس الصفحة
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
    );
  }
}
