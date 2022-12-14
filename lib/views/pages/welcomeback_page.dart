import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeBackPage extends StatelessWidget {
  const WelcomeBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: Paddings.sidePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome back!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: Get.height / 15,
              ),
              ButtonBuilder(
                text: 'Continue',
                onPressed: () {
                  Get.offAll((LandingPage()));
                },
                color: AppColors.appPrimary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
