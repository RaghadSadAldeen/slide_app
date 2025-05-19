import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';



// تعريف Widget ثابتة بدون حالة تعرض حقول قابلة للتعديل
class EditableFields extends StatelessWidget {
  const EditableFields({super.key});

  @override
  Widget build(BuildContext context) {
    // تنسيق موحد لكل حقول الإدخال (لون خلفية، حواف، padding...)
    final fieldDecoration = InputDecoration(
      filled: true, // ملئ خلفية الحقل بلون
      fillColor: Colors.grey.shade200, // لون الخلفية رمادي فاتح
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),  // المسافة داخل الحقل حول النص
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), // حواف دائرية بزاوية 12
        borderSide: BorderSide(color: Colors.grey.shade400, width: 1), // حافة رمادية بسيطة بسمك 1
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), // نفس شكل الحافة عند تمكين الحقل
        borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), // حواف عند التركيز على الحقل
      ),
    );


    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            decoration: fieldDecoration.copyWith(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            decoration: fieldDecoration.copyWith(
              labelText: 'Phone',
              prefixIcon: Icon(Icons.phone),
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            decoration: fieldDecoration.copyWith(
              labelText: 'Address',
              prefixIcon: Icon(Icons.location_on),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            decoration: fieldDecoration.copyWith(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            decoration: fieldDecoration.copyWith(
              labelText: 'Majoring',
              prefixIcon: Icon(Icons.school),
            ),
          ),
        ),

        // زر الحفظ
        ElevatedButton(
          onPressed: () {
            // هنا تكتب كود الحفظ أو المعالجة
            print('Save button pressed');
          },
          child: const Text(
            'Save',
            style: TextStyle(color: whiteColor),  // خلي النص أبيض
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: deepForestGreen,  // خليها backgroundColor
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
