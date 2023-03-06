import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/views/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllChatsPage extends StatelessWidget {
  AllChatsPage({super.key});
  AuthController auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chats'), centerTitle: true),
      body: ListView.builder(
          itemCount: auth.listStudentModels.length,
          itemBuilder: (context, index) {
            print(auth.listStudentModels.toString());
            return auth.listStudentModels[index].userId ==
                    auth.account['userID']
                ? const SizedBox()
                : ListTile(
                    leading: CircleAvatar(),
                    title: Text(
                        auth.listStudentModels[index].studentName!),
                    onTap: () {
                      Get.to(() => Basic());
                    },
                  );
          }),
    );
  }
}
