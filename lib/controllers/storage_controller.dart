import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:alsham_socialmedia/constants/urls.dart';
import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/customfullscreendialog.dart';
import 'package:alsham_socialmedia/services/api_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase/supabase.dart';

class StorageController extends GetxController {
  late SupabaseClient client;
  bool uploadState = true;
  RxList<FileObject> fileList = RxList<FileObject>();
  RxList<FileObject> folderList = RxList<FileObject>();

  String profilePic = '';
  @override
  void onInit() async {
    client = SupabaseClient(URLS.supabaseURL, URLS.supabaseKey);
    // await fetchFiles();
    await fetchFolders();
    super.onInit();
  }

  void uploadFile() async {
    uploadState = false;
    var pickedFiles =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (pickedFiles != null) {
      final file = File(pickedFiles.files.first.path!);
      CustomFullScreenDialog.showDialog();
      await client.storage
          .from('lectures')
          .upload(pickedFiles.files.first.name, file)
          .then((value) {
        print(value);
        uploadState = true;
        CustomFullScreenDialog.cancelDialog();
      });
    }
  }

  fetchFolders() async {
    folderList.assignAll(await client.storage
        .from('lectures')
        .list()
        .catchError((e) => throw e));
  }

  Future<List<FileObject>> fetchFiles(String path) async {
    fileList.assignAll(await client.storage
        .from('lectures')
        .list(path: path)
        .whenComplete(() {
      if (fileList.isNotEmpty) print(fileList.first.name);
      print('+++++ fetched +++++');
    }).catchError((e) {
      throw e;
    }));
    return fileList.value;
  }

  // downloadFile(String fileName, String filePath) async {
  //   var downloadedFile = await client.storage
  //       .from('lectures')
  //       .download('$filePath/$fileName');
  //   File file = File.fromRawPath(downloadedFile);
  // }

  download(String fileName, String filePath, String ext) async {
    if (Platform.isIOS || Platform.isAndroid || Platform.isMacOS) {
      bool status = await Permission.storage.isGranted;

      if (!status) await Permission.storage.request();
    }
    CustomFullScreenDialog.showDialog();
    var downloadedFile = await client.storage
        .from('lectures')
        .download('$filePath/$fileName')
        .whenComplete(() => CustomFullScreenDialog.cancelDialog());
    String path = await FileSaver.instance
        .saveFile(fileName, downloadedFile, ext);
    log(path);
  }

  Future<String> uploadProfilePic(String studentId) async {
    String url = '';
    uploadState = false;
    var pickedFiles =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (pickedFiles != null) {
      final picture = File(pickedFiles.files.first.path!);
      CustomFullScreenDialog.showDialog();
      await client.storage
          .from('profile-pictures')
          .upload(
            '$studentId/${pickedFiles.files.first.name}',
            picture,
          )
          .then((path) {
        url = client.storage.from('profile-pictures').getPublicUrl(
            "$studentId/${pickedFiles.files.first.name}");

        print(url);
        uploadState = true;
        CustomFullScreenDialog.cancelDialog();
      });
    }
    return url;
  }

  updateProfilePic(String studentId) async {
    uploadState = false;
    var pickedFiles =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (pickedFiles != null) {
      final picture = File(pickedFiles.files.first.path!);
      CustomFullScreenDialog.showDialog();
      await client.storage
          .from('profile-pictures')
          .upload(
            '$studentId/${pickedFiles.files.first.name}',
            picture,
          )
          .then((value) {
        print(value);
        uploadState = true;
        CustomFullScreenDialog.cancelDialog();
      });
    }
  }
}
