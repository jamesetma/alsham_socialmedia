import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/post_container.dart';
import 'package:alsham_socialmedia/views/pages/chat_page.dart';
import 'package:alsham_socialmedia/views/pages/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class MyProfilePage extends StatelessWidget {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Paddings.bothPadding,
          child: FutureBuilder(
              future: auth.getStudent(),
              builder:
                  (context, AsyncSnapshot<StudentModel> snapshot) {
                final student = snapshot.data;
                return student == null
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(radius: 30),
                            title: Text(student.studentName!),
                            subtitle:
                                Text(student.academicYear ?? ''),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              student.biography ?? '',
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: ButtonBuilder(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.white),
                              onPressed: () {
                                Get.to(() => EditPage(),
                                    arguments: student);
                              },
                              text: 'Edit Profile',
                            ),
                          ),
                        ],
                      );
              }),
        ),
      ),
    );
  }
}
