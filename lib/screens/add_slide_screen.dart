import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';
import 'package:slide_app/widgets/Add_screen/AddAbleFlids.dart';
import 'package:slide_app/widgets/Add_screen/text_addslide.dart';

class AddSlideScreen extends StatelessWidget {
  const AddSlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: addSlideTitle,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24), // 🔹 مسافة قبل الصورة والاسم
                // ⭐️ صف يحتوي على الصورة والاسم بجانبها
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://th.bing.com/th/id/OIP.vJ_K7NuQb8FWYUnvYZo6BAHaLH?cb=iwc2&rs=1&pid=ImgDetMain',
                            height: 75,
                            width: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: () {
                              // لتعديل الصورة لاحقًا
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16), // مسافة بين الصورة والاسم
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          nameText,
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
                const AddableFields(), // الحقول القابلة للإضافة
              ],
            ),
          ),
        ),
      ),
    );
  }
}
