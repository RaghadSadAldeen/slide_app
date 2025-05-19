import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';
import 'package:slide_app/widgets/profile_screen/textProfile.dart';
import 'package:slide_app/widgets/profile_screen/EditableFields.dart'; // عدّل المسار حسب موقع الملف

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: editProfileTitle,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);  // رجوع للشاشة السابقة
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),


      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints(maxWidth: 400), // أقصى عرض للصفحة
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://th.bing.com/th/id/OIP.vJ_K7NuQb8FWYUnvYZo6BAHaLH?cb=iwc2&rs=1&pid=ImgDetMain',
                        height: 175,
                        width: 175,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8, right: 8,
                      child: GestureDetector(
                        onTap: () {
                          // هنا تضيف الكود لتعديل الصورة أو تفعيل الـ Firebase
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: deepForestGreen,
                            shape: BoxShape.circle,
                            border: Border.all(color: whiteColor, width: 2),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 20,
                            color:whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12), // مسافة بين الصورة والنص الأول
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // يخلي كل النصوص بالمنتصف أفقياً
                  children: [
                    nameprofile,
                    emailProfile,
                    const SizedBox(height: 5),
                    const SizedBox(height: 22),
                    const EditableFields(), // الحقول تظل تأخذ العرض الكامل الممكن
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
