import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slide_app/constants/colors.dart';
import 'dart:io';

class AddableFields extends StatefulWidget {
  const AddableFields({super.key});

  @override
  State<AddableFields> createState() => _AddableFieldsState();
}

class _AddableFieldsState extends State<AddableFields> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final fieldDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade200,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildField('Name', Icons.person, TextInputType.name, fieldDecoration),
        buildField('Email', Icons.email, TextInputType.emailAddress, fieldDecoration),
        buildField('Slide Title', Icons.title, TextInputType.text, fieldDecoration),

        // وصف الأغراض (حقل كبير)
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            maxLines: 2,
            keyboardType: TextInputType.multiline,
            decoration: fieldDecoration.copyWith(
              labelText: 'Description',
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.description),
            ),
          ),
        ),

        // 🔽 اختيار صورة
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Upload Image',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: _selectedImage != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(_selectedImage!, fit: BoxFit.cover),
                  )
                      : const Center(
                    child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),

        // 🔘 زر الحفظ
        ElevatedButton(
          onPressed: () {
            print('Save button pressed');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: deepForestGreen,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Save', style: TextStyle(color: whiteColor)),
        ),
      ],
    );
  }

  Widget buildField(String label, IconData icon, TextInputType inputType, InputDecoration decoration) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        keyboardType: inputType,
        decoration: decoration.copyWith(
          labelText: label,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
