import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/controllers/newchat_controller.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  ChatController chat =
      Get.put(ChatController(receiverId: Get.arguments.toString()));
  AuthController auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              chat.dispose();
              Get.back();
            },
          ),
          title: const Text(
            'Chat',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0),
      body: Obx(() {
        return DashChat(
            currentUser: chat.currentUser,
            onSend: (ChatMessage m) async {
              // chat.messages.insert(0, m);
              await chat
                  .sendMessage(m.text, Get.arguments.toString())
                  .whenComplete(() => chat.getUserMessages(
                      chat.currentUser.id, Get.arguments.toString()));
            },
            messageOptions: const MessageOptions(showTime: true),
            messages: chat.messages.value);
      }),
    );
  }
}
