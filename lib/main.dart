import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/views/pages/forgotpassword_verification_page.dart';
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
      home: const ForgotPasswordVerificationPage(),
    );
  }
}
