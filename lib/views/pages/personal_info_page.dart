import 'dart:convert';

import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/controllers/storage_controller.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/textfield_builder.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoPage extends StatelessWidget {
  PersonalInfoPage({Key? key}) : super(key: key);

  final AuthController auth = Get.put(AuthController());
  StudentController controller = Get.find<StudentController>();
  StorageController storage = Get.find<StorageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: Paddings.sidePadding,
        child: SingleChildScrollView(
          child: Form(
            key: controller.key1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Student Credentials',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('Username'),
                ),
                TextFieldBuilder(
                  controller: auth.username,
                  validator: (username) {
                    if (!username!.contains(' ')) {
                      return null;
                    } else
                      return 'field should not have spaces';
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('Password'),
                ),
                TextFieldBuilder(
                  obsecureText: true,
                  controller: auth.password,
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'Student Information',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('Name'),
                ),
                TextFieldBuilder(controller: controller.studentName),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('Phone number'),
                ),
                TextFieldBuilder(controller: controller.studentPhone),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('Academic Year'),
                ),
                TextFieldBuilder(
                    controller: controller.studentAcademicYear),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('University Number'),
                ),
                TextFieldBuilder(
                  controller: controller.studentUniNumber,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ButtonBuilder(
                            text: 'Done',
                            color: AppColors.appPrimary,
                            onPressed: () async {
                              Map user = {};
                              await auth.signup().then((value) async {
                                controller.createStudent(await json
                                    .decode(value.body,
                                        reviver: (k, v) {
                                  user.addAll({k: v});
                                  print(user['userID']);
                                  return user['userID'];
                                }));
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
