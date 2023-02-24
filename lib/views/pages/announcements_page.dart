import 'dart:ffi';

import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/controllers/user_controller.dart';
import 'package:alsham_socialmedia/views/components/textfield_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementsPage extends StatelessWidget {
  final StudentsController controller = Get.put(StudentsController());
  TextEditingController studentId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ListView.builder(
          //   itemCount: controller.students.length,
          //   shrinkWrap: true,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       leading: Text(
          //           controller.students[index].studentName ?? 'null'),
          //     );
          //   },
          // ),
          TextFieldBuilder(
            controller: controller.studentName,
            prefixIcon: Icon(Icons.person),
          ),
          TextFieldBuilder(
            controller: controller.studentUniNumber,
            prefixIcon: Icon(Icons.numbers),
          ),
          TextFieldBuilder(
            controller: studentId,
            prefixIcon: Icon(Icons.abc),
          ),
          ElevatedButton(
              onPressed: () {
                controller.createStudent();
              },
              child: Text('Submit')),
          ElevatedButton(
              onPressed: () {
                controller.deleteStudent(int.parse(studentId.text));
              },
              child: Text('delete'))
        ],
      ),
    );
  }
}
