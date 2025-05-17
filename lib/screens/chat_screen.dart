import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;
  final String contactImageUrl;

  const ChatScreen({super.key, required this.contactName, required this.contactImageUrl});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hi there!',
      'isMe': false,
    },
    {
      'text': 'Hello! How are you?',
      'isMe': true,
    },
  ];

  void sendMessage() {
    String text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({
        'text': text,
        'isMe': true,
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sageGreen,
      appBar: AppBar(
        backgroundColor: whiteColor,
        iconTheme: const IconThemeData(color: deepForestGreen),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: widget.contactImageUrl.isNotEmpty
                  ? NetworkImage(widget.contactImageUrl)
                  : null,
              backgroundColor: deepForestGreen,
              child: widget.contactImageUrl.isEmpty
                  ? Text(
                widget.contactName[0],
                style: const TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 20),
              )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              widget.contactName,
              style: const TextStyle(
                color: deepForestGreen,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return ChatBubble(
                  text: msg['text'],
                  isMe: msg['isMe'],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: whiteColor,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add, color: deepForestGreen),
                  onPressed: () {

                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Write a message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: deepForestGreen),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
