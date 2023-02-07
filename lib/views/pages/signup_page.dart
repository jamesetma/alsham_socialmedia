import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/controllers/signup_controller.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/pages/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  SignupController controller = Get.put(SignupController());
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        // leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: Paddings.sidePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Phone',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const Text('Enter your phone number'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Form(
                key: controller.numberKey,
                child: TextFormField(
                  controller: controller.numberController,
                  validator: (value) {},
                  decoration: InputDecoration(
                    hintText: '+963 992 555 666',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ButtonBuilder(
                    color: AppColors.appPrimary,
                    text: 'Next',
                    textColor: AppColors.white,
                    onPressed: () {
                      authController.phoneSignIn(
                          controller.numberController.text, context);
                      // Get.to(() => VerificationPage());
                    },
                  ),
                ),
              ),
            ),
            // Row(children: [Text('')],)
          ],
        ),
      ),
    );
  }
}
