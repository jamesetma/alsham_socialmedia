import 'package:alsham_socialmedia/constants/app_colors.dart';
<<<<<<< Updated upstream
=======
import 'package:alsham_socialmedia/views/pages/create_post_page.dart';
import 'package:alsham_socialmedia/views/pages/edit_page.dart';
import 'package:alsham_socialmedia/views/pages/edit_page2.dart';
import 'package:alsham_socialmedia/views/pages/face_book.dart';
import 'package:alsham_socialmedia/views/pages/landing_page.dart';
import 'package:alsham_socialmedia/views/pages/landing_page2.dart';
import 'package:alsham_socialmedia/views/pages/login_page.dart';
import 'package:alsham_socialmedia/views/pages/login_page2.dart';
import 'package:alsham_socialmedia/views/pages/notifications_page.dart';
>>>>>>> Stashed changes
import 'package:alsham_socialmedia/views/pages/personal_info_page.dart';
import 'package:alsham_socialmedia/views/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
<<<<<<< Updated upstream
      home: const PersonalInfoPage(),
=======
      home: FaceBook(),
>>>>>>> Stashed changes
    );
  }
}
