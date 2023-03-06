import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/controllers/chat_controller.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Basic extends StatefulWidget {
  @override
  _BasicState createState() => _BasicState();
}

ChatController chat = Get.put(ChatController());
AuthController auth = Get.find<AuthController>();

class _BasicState extends State<Basic> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic example'),
      ),
      body: Obx(() {
        return DashChat(
          currentUser: chat.user,
          onSend: (ChatMessage m) {
            setState(() {
              chat.messagesList.insert(0, m);
              chat.socket.emit("message", {
                "uid": chat.user.id,
                "username": chat.user.firstName,
                "message": m.text,
              });
            });
          },

          messageOptions: MessageOptions(showTime: true),
          // messageListOptions:
          // MessageListOptions(dateSeparatorFormat:  ),
          // inputOptions: InputOptions(),
          // ignore: invalid_use_of_protected_member
          messages: chat.messagesList.value,
        );
      }),
    );
  }
}
