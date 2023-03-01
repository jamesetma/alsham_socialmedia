import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {required this.username,
      required this.message,
      required this.timestamp,
      super.key});

  final String username;
  final String message;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          leading: Text(timestamp),
          title: Text(username),
          subtitle: Text(
            message,
            style: TextStyle(fontSize: 14),
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
