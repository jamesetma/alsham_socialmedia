import 'package:alsham_socialmedia/controllers/splash_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      controller.choosePath();
    });
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Image.asset(
          'assets/alsham_logo.jpg',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
