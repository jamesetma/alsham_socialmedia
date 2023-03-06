import 'dart:developer';
import 'dart:io';

import 'package:alsham_socialmedia/constants/urls.dart';
import 'package:alsham_socialmedia/customfullscreendialog.dart';
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
  @override
  void onInit() async {
    client = SupabaseClient(URLS.supabaseURL, URLS.supabaseKey);
    await fetchFiles();
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

  fetchFiles() async {
    fileList.addAll(await client.storage
        .from('lectures')
        .list(path: 'parallel_programming')
        .whenComplete(() {
      if (fileList.isNotEmpty) print(fileList.first.name);
      print('+++++ fetched +++++');
    }).catchError((e) {
      throw e;
    }));
  }

  downloadFile(String fileName) async {
    var downloadedFile = await client.storage
        .from('lectures')
        .download('parallel_programming/$fileName');
    File file = File.fromRawPath(downloadedFile);
  }

  download(String? fileName, String? ext) async {
    if (Platform.isIOS || Platform.isAndroid || Platform.isMacOS) {
      bool status = await Permission.storage.isGranted;

      if (!status) await Permission.storage.request();
    }

    var downloadedFile = await client.storage
        .from('lectures')
        .download('parallel_programming/$fileName');

    String path = await FileSaver.instance
        .saveFile(fileName!, downloadedFile, ext!);
    log(path);
  }
}
