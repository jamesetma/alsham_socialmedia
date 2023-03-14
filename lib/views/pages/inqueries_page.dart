import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/controllers/announcements_controller.dart';
import 'package:alsham_socialmedia/controllers/inqueries_controller.dart';
import 'package:alsham_socialmedia/controllers/storage_controller.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/views/components/post_container.dart';
import 'package:alsham_socialmedia/views/pages/create_announcement_page.dart';
import 'package:alsham_socialmedia/views/pages/create_inquery.dart';
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
                Get.to(() => CreateInqueriesPage());
              },
              color: Colors.black,
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () async {
                await controller.getInqueries().then((value) {
                  print('reloaded inqueries');
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
          child: studentController.isAdmin() == true
              ? ListView.builder(
                  itemCount: controller.inqueries.value.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      PostContainer(
                          name: controller.inqueries[index].username!,
                          caption: controller.inqueries[index].text!),
                      const Divider()
                    ]);
                  })
              : ListView.builder(
                  itemCount:
                      controller.filteredInqueries.value.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      PostContainer(
                        name: controller
                            .filteredInqueries[index].username!,
                        caption:
                            controller.filteredInqueries[index].text!,
                      ),
                      const Divider()
                    ]);
                  }),
        );
      }),
    );
  }
}
