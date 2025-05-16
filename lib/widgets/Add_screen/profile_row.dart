import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  final String name;
  final String imageUrl;

  const ProfileRow({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 31,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(width: 20),
        Text(
          name,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
