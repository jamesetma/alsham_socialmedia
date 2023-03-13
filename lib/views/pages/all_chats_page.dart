import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:alsham_socialmedia/views/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllChatsPage extends StatelessWidget {
  AllChatsPage({super.key});
  AuthController auth = Get.find<AuthController>();
  StudentController controller = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Chats',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: controller.listStudentModels.length,
            itemBuilder: (context, index) {
              debugPrint(controller.listStudentModels.toString());
              return controller.listStudentModels[index].userId ==
                      auth.account['userID']
                  ? const SizedBox()
                  : ListTile(
                      leading: const CircleAvatar(),
                      title: Text(controller
                          .listStudentModels[index].studentName!),
                      onTap: () {
                        Get.to(() => ChatPage(),
                            arguments: controller
                                .listStudentModels[index].userId);
                      },
                    );
            }));
  }
}
