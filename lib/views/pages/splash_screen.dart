import 'dart:async';

import 'package:alsham_socialmedia/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () => Get.off(LoginPage()));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 90),
            CircleAvatar(
              radius: Get.height / 3,
              backgroundColor: Colors.white,
              child: Image(
                image: AssetImage('assets/images/SAS.gif'),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
