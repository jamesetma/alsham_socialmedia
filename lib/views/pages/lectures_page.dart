import 'package:alsham_socialmedia/controllers/storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class LecturesPage extends StatelessWidget {
  LecturesPage({super.key});

  StorageController storage = Get.put(StorageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ]),
        body: ListView.builder(
          itemCount: storage.fileList.length,
          itemBuilder: (context, index) {
            return Obx(
              () => ListTile(
                leading: Icon(IconlyBold.download),
                title: Text(storage.fileList[index].name),
                onTap: () {
                  storage.download(
                      storage.fileList[index].name, 'pdf');
                },
              ),
            );
          },
        ));
  }
}
