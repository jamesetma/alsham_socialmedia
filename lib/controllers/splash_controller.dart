import 'package:alsham_socialmedia/views/pages/landing_page.dart';
import 'package:alsham_socialmedia/views/pages/login_page.dart';
import 'package:alsham_socialmedia/views/pages/personal_info_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void choosePath() {
    if (firebaseAuth.currentUser != null) {
      handleAuthStateChanged(true);
    } else {
      handleAuthStateChanged(false);
    }
  }

  void handleAuthStateChanged(isLoggedIn) async {
    if (isLoggedIn == false) {
      // ignore: prefer_const_constructors
      Get.offAll(() => LoginPage());
      return;
    }
    try {
      DocumentReference<Map<String, dynamic>> user = FirebaseFirestore
          .instance
          .collection('users')
          .doc(firebaseAuth.currentUser?.uid);

      await user.get().then(
        (DocumentSnapshot doc) {
          if (doc.exists) {
            debugPrint('Document Exists');
            Get.offAll(() => LandingPage());
            // Get.offAll(() => LandingPage(), arguments: firebaseAuth.currentUser);
          } else {
            Get.offAll(() => PersonalInfoPage());
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      printError(info: 'firebase error');
    } catch (_) {
      print('some other error');
    }
  }
}
