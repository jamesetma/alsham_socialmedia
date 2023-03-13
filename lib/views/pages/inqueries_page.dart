import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/controllers/announcements_controller.dart';
import 'package:alsham_socialmedia/controllers/inqueries_controller.dart';
import 'package:alsham_socialmedia/controllers/storage_controller.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/views/components/post_container.dart';
import 'package:alsham_socialmedia/views/pages/create_announcement_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class InqueriesPage extends StatelessWidget {
  final InqueriesController controller =
      Get.put(InqueriesController());
  StudentController studentController = Get.find<StudentController>();
  TextEditingController studentId = TextEditingController();
  StorageController storage = Get.put(StorageController());
  String picUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => CreatePostPage());
              },
              color: Colors.black,
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () async {
                await controller.getInqueries().then((value) {
                  print('reloaded!!!');
                });
              },
              color: Colors.black,
              icon: const Icon(Icons.redo))
        ],
        centerTitle: true,
        title: const Text(
          'Inqueries',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(() {
        return Padding(
          padding: Paddings.sidePadding,
          child: ListView.builder(
              itemCount: studentController.isAdmin() == true
                  ? controller.inqueries.value.length
                  : controller.filteredInqueries.value.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  PostContainer(
                    name: studentController.isAdmin() == true
                        ? controller.inqueries[index].username!
                        : controller
                            .filteredInqueries[index].username!,
                    caption: studentController.isAdmin() == true
                        ? controller.inqueries[index].text!
                        : controller.filteredInqueries[index].text!,
                  ),
                  const Divider()
                ]);
              }),
        );
      }),
    );
  }
}
