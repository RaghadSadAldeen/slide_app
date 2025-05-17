import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/chat_list_item.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkTeal,
      appBar: AppBar(
        backgroundColor: deepForestGreen,
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(
            color: whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          ChatListItem(
            name: 'Mohamad',
            lastMessage: "Hello Nabil",
            date: 'Today',
            avatarColor: sageGreen,
            unreadCount: 2,
          ),
          ChatListItem(
            name: 'Nabil',
            lastMessage: 'Today Message',
            date: 'Today',
            avatarColor: deepForestGreen,
            unreadCount: 0,
          ),
          ChatListItem(
            name: 'AUser',
            lastMessage: 'hello',
            date: 'Nov 28, 2020',
            avatarColor: sageGreen,
            unreadCount: 5,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:  deepForestGreen,
        selectedItemColor: warmBeige,
        unselectedItemColor: Colors.grey[500],
        selectedIconTheme: const IconThemeData(size: 28),
        unselectedIconTheme: const IconThemeData(size: 24),
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 13),
        currentIndex: 0,
        onTap: (index) {

        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
