import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';
import 'package:slide_app/widgets/custom_text_field.dart';
import 'get_slide_screen.dart';
import 'package:slide_app/constants/text_styles.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const Text(
                'Add Slide',
                style: AppTextStyles.addSlideTitle,
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://hiragate.com/wp-content/uploads/2017/07/73.jpg'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Raghad Sad aldeen',
                    style: AppTextStyles.profileName,
                    ),
                ],
              ),
              const SizedBox(height: 30),

              CustomTextField(label: 'Name', controller: nameController),
              CustomTextField(label: 'Email', controller: emailController),
              CustomTextField(label: 'College:', controller: collegeController),
              CustomTextField(label: 'Description:', controller: descController),

              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkTeal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
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
    );
  }
}
