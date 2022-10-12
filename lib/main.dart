import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/views/pages/landing_page.dart';
import 'package:alsham_socialmedia/views/pages/login_page.dart';

import 'package:alsham_socialmedia/views/pages/personal_info_page.dart';
import 'package:alsham_socialmedia/views/pages/signup_page.dart';
import 'package:alsham_socialmedia/views/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      home: LoginPage(),
    );
  }
}
