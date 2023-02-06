import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
<<<<<<< Updated upstream
=======
import 'package:alsham_socialmedia/views/pages/personal_info_page.dart';
import 'package:alsham_socialmedia/views/pages/signup_page.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
          padding: Paddings.sidePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'OTP sent',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const Text('Enter the OTP sent to you'),
              PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (val) {},
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    activeColor: AppColors.appPrimary,
                    inactiveColor: AppColors.appPrimary,
                    selectedColor: AppColors.appPrimary,
                    activeFillColor: AppColors.appPrimary,
                    inactiveFillColor: AppColors.appPrimary,
                    selectedFillColor: AppColors.appPrimary,
                    fieldWidth: Get.width / 7),
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
                        // Get.to(() => const VerificationPage());
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t  have an account?'),
                  TextButton(
                      onPressed: () {
                        Get.to(() => SignupPage());
                      },
                      child: Text('Sign Up')),
                ],
              ),
            ],
          )),
    );
  }
}
