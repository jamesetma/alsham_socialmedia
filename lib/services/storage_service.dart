import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/foundation.dart';

class Storage {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late String downloadURL;

  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadImage(String imagePath, String imageName) async {
    File image = File(imagePath);
    try {
      await firebaseStorage
          .ref('${firebaseAuth.currentUser?.uid}/$imageName')
          .putFile(image)
          .whenComplete(() async {
        downloadURL = await getDownloadURL(imageName);
        FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseAuth.currentUser?.uid)
            .set({
          'imageUrls': FieldValue.arrayUnion([downloadURL])
        }, SetOptions(merge: true));
      });
      return downloadURL;
    } on firebase_core.FirebaseException catch (e) {
      debugPrint(e.toString());
      return "error";
    }
  }

  Future<String> getDownloadURL(String imageName) async {
    String downloadURL = await firebaseStorage
        .ref('${firebaseAuth.currentUser?.uid}/$imageName')
        .getDownloadURL();

    return downloadURL;
  }

  // Future<void> listFiles() async {
  //   ListResult results = await firebaseStorage
  //       .ref(landingPageController.user!.uid)
  //       .listAll();
  //   print(results.toString());

  //   results.items.forEach((Reference ref) {
  //     print('found results $ref');
  //   });
  // }

  // Future<String> downloadImage(String name) async {
  //   // ListResult results = await firebaseStorage.ref('test/').listAll();
  //   String downloadedImage = await firebaseStorage
  //       .ref('${landingPageController.user!.uid}')
  //       .getDownloadURL();

  //   return downloadedImage;
  // }
}
