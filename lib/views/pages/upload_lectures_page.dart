import 'package:alsham_socialmedia/controllers/storage_controller.dart';
import 'package:alsham_socialmedia/controllers/lecture_controller.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/dropdown_menu_builder.dart';
import 'package:alsham_socialmedia/views/components/textfield_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadLectures extends StatelessWidget {
  UploadLectures({super.key});
  LectureController controller = Get.put(LectureController());
  StorageController storage = Get.put(StorageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload lectures'),
        centerTitle: true,
      ),
      body: Column(children: [
        const Text('Name of lecture'),
        TextFieldBuilder(controller: controller.lectureName),
        const Text('subject'),
        DropDownMenu(currentValue: '', items: []),
        ButtonBuilder(
          text: "UPLOAD",
          onPressed: () async {
            storage.uploadFile();
            if (storage.uploadState) {
              const GetSnackBar(
                message: "uploaded successfully",
              );
            }
          },
        )
      ]),
    );
  }
}
