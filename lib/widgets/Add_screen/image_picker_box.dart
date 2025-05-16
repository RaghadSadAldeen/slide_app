import 'package:flutter/material.dart';
import 'dart:io';

class ImagePickerBox extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onTap;

  const ImagePickerBox({
    super.key,
    required this.selectedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: selectedImage == null
            ? const Center(child: Text('Click to add slide image'))
            : ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(selectedImage!, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
