import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/controllers/announcements_controller.dart';
import 'package:alsham_socialmedia/controllers/inqueries_controller.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/controllers/tag_controller.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/textbox_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateInqueriesPage extends StatefulWidget {
  const CreateInqueriesPage({super.key});

  @override
  State<CreateInqueriesPage> createState() =>
      _CreateInqueriesPageState();
}

class _CreateInqueriesPageState extends State<CreateInqueriesPage> {
  InqueriesController controller = Get.find<InqueriesController>();
  TagController tag = Get.find<TagController>();

  StudentController studentController = Get.find<StudentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Post',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: Paddings.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text('Select image'),
            ),
            ButtonBuilder(
              textColor: Colors.white,
              text: 'upload image',
              onPressed: () {},
              color: AppColors.appPrimary,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text('Add caption'),
            ),
            TextBoxBuilder(
              controller: controller.caption,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text('Add hashtag'),
            ),
            DropdownButton<String>(
              hint: const Text('Tags'),
              value: studentController.tagName,
              onChanged: (value) {
                setState(() {
                  studentController.setTagName(value!);
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
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ButtonBuilder(
                onPressed: () async {
                  await controller
                      .postinquery()
                      .then((i) => Get.back());
                },
                color: AppColors.appPrimary,
                text: 'Post',
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
