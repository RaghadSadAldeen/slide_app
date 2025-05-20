import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';

class EditableFields extends StatefulWidget {
  final Function({
  required String name,
  required String phone,
  required String address,
  required String email,
  required String major,
  }) onSave;

  const EditableFields({super.key, required this.onSave});

  @override
  State<EditableFields> createState() => _EditableFieldsState();
}

class _EditableFieldsState extends State<EditableFields> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController majorController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();
    majorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fieldDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade200,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            controller: nameController,
            decoration: fieldDecoration.copyWith(
              labelText: 'Name',
              prefixIcon: const Icon(Icons.person),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            controller: phoneController,
            decoration: fieldDecoration.copyWith(
              labelText: 'Phone',
              prefixIcon: const Icon(Icons.phone),
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            controller: addressController,
            decoration: fieldDecoration.copyWith(
              labelText: 'Address',
              prefixIcon: const Icon(Icons.location_on),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            controller: emailController,
            decoration: fieldDecoration.copyWith(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            controller: majorController,
            decoration: fieldDecoration.copyWith(
              labelText: 'Majoring',
              prefixIcon: const Icon(Icons.school),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(
              name: nameController.text,
              phone: phoneController.text,
              address: addressController.text,
              email: emailController.text,
              major: majorController.text,
            );
          },
          child: const Text(
            'Save',
            style: TextStyle(color: whiteColor),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: deepForestGreen,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
