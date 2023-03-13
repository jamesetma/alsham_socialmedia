import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/controllers/tag_controller.dart';
import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:alsham_socialmedia/models/student_subject_model.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/pages/edit_page.dart';
import 'package:alsham_socialmedia/views/pages/login_page.dart';
import 'package:alsham_socialmedia/views/pages/personal_info_page.dart';
import 'package:alsham_socialmedia/views/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  StudentController controller = Get.find<StudentController>();
  TagController tag = Get.find<TagController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          controller.isAdmin() == false
              ? SizedBox()
              : IconButton(
                  onPressed: () {
                    Get.to(() => PersonalInfoPage());
                  },
                  color: Colors.black,
                  icon: Icon(Icons.add),
                ),
          IconButton(
              onPressed: () => Get.offAll(LoginPage()),
              color: Colors.black,
              icon: Icon(Icons.logout))
        ],
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('My Profile',
            style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Paddings.bothPadding,
          child: Column(
            children: [
              FutureBuilder(
                  future: controller.getStudent(),
                  builder: (context,
                      AsyncSnapshot<StudentModel> snapshot) {
                    StudentModel? student = snapshot.data;
                    return student == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        'assets/images/1.jpg')),
                                title: Text(student.studentName!),
                                subtitle: controller.isAdmin() == true
                                    ? SizedBox()
                                    : Text(
                                        student.academicYear ?? ''),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8),
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
              const SizedBox(
                height: 25,
              ),
              controller.isAdmin() == true
                  ? SizedBox()
                  : Column(
                      children: [
                        DropdownButton<String>(
                          hint: const Text('Subjects'),
                          value: controller.tagName,
                          onChanged: (value) {
                            setState(() {
                              controller.setTagName(value!);
                            });
                          },
                          items: tag.tagNameList
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                ),
                              )
                              .toList(),
                        ),
                        Column(
                          children: [
                            for (StudentSubjectModel item
                                in controller.studentSubjects)
                              ListTile(
                                  title: Text(item.tagId.toString()))
                          ],
                        ),
                        ButtonBuilder(
                          text: "Add",
                          onPressed: () async {
                            await controller.addStudentSubject();
                            controller.studentSubjects.assignAll(
                                await controller
                                    .getStudentSubjects());

                            setState(() {});
                          },
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
