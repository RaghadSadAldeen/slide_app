import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/chat_screen.dart';

class ChatListItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String date;
  final Color avatarColor;
  final int unreadCount;

  const ChatListItem({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.date,
    required this.avatarColor,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: deepForestGreen.withOpacity(0.8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(
                contactName: name,
                contactImageUrl: '',
              ),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: avatarColor,
          radius: 24,
          child: Text(
            name[0],
            style: const TextStyle(color: whiteColor, fontSize: 18),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          lastMessage,
          style: TextStyle(color: Colors.grey[300], fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              date,
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
            if (unreadCount > 0)
              Container(
                margin: const EdgeInsets.only(top: 6),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: sageGreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  unreadCount.toString(),
                  style: const TextStyle(color: whiteColor, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
