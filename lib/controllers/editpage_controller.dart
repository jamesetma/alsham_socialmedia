// import 'dart:io';
// import 'package:alsham_socialmedia/services/storage_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class EditPageController extends GetxController {
//   RxList<File> imageList = RxList<File>([]);
//   late Storage storage;

//   pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(
//         source: source,
//       );
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       imageList.add(imageTemporary);
//       if (imageList.length >= 2) {}
//       final path = image.path;
//       final fileName = image.name;
//       debugPrint(path);
//       debugPrint(fileName);

//       debugPrint('image stored in list');
//       storage.uploadImage(path, fileName);
//       // final snapshot = await getCurrentUser();
//       // if (snapshot!.imageUrls!.length <= 3) {
//       // }
//     } on PlatformException catch (e) {
//       debugPrint('failed to pick image: $e');
//     }
//   }
// }
