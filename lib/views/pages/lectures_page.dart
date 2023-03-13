import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/controllers/storage_controller.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/views/pages/upload_lectures_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:supabase/supabase.dart';

class LecturesPage extends StatelessWidget {
  LecturesPage({super.key});
  StudentController studentController = Get.find<StudentController>();
  StorageController storage = Get.put(StorageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: AppColors.white,
            title: const Text('Lectures',
                style: TextStyle(color: Colors.black)),
            actions: [
              studentController.isAdmin() == false
                  ? SizedBox()
                  : IconButton(
                      onPressed: () {
                        Get.to(() => UploadLectures());
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.black,
                    )
            ]),
        body: ListView.builder(
          itemCount: storage.folderList.length,
          itemBuilder: (context, index) {
            RxList<FileObject> fileList = RxList<FileObject>();
            return Obx(() {
              return ExpansionTile(
                  title: Text(storage.folderList[index].name),
                  maintainState: true,
                  onExpansionChanged: (value) async {
                    if (value && fileList.isEmpty) {
                      fileList.value = await storage
                          .fetchFiles(storage.folderList[index].name);
                      print(fileList.first.name);
                    }
                  },
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: fileList.length,
                      itemBuilder: (BuildContext context, int i) {
                        return ListTile(
                          leading: const Icon(IconlyBold.download),
                          title: Text(fileList[i].name),
                          onTap: () {
                            storage.download(
                                fileList[i].name,
                                storage.folderList[index].name,
                                'pdf');
                          },
                        );
                      },
                    )
                  ]);
            });
          },
        ));
  }
}
