import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';
import 'package:slide_app/widgets/edit_profile_screen/edit_able_Fields.dart';
import 'package:slide_app/widgets/edit_profile_screen/text_edit_profile.dart';
import 'package:slide_app/screens/profile_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: editProfileTitle,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
                      bottom: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {},
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
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    nameEditProfile,
                    EmailEditProfile,
                    const SizedBox(height: 5),
                    const SizedBox(height: 22),
                    EditableFields(
                      onSave: ({
                        required String name,
                        required String phone,
                        required String address,
                        required String email,
                        required String major,
                      }) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(
                              name: name,
                              phone: phone,
                              address: address,
                              email: email,
                              major: major,
                            ),
                          ),
                        );
                      },
                    ),
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
