import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/pages/forgot_password.dart';
import 'package:alsham_socialmedia/views/pages/new_password_page.dart';
import 'package:alsham_socialmedia/views/pages/personal_info_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordVerificationPage extends StatelessWidget {
  const ForgotPasswordVerificationPage({Key? key}) : super(key: key);

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
                enableActiveFill: true,
                appContext: context,
                length: 6,
                animationType: AnimationType.fade,
                onChanged: (val) {
                  Get.to(() {
                    PersonalInfoPage();
                  });
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: Get.height / 12,
                  fieldWidth: Get.width / 8,
                  activeColor: AppColors.appPrimary,
                  inactiveColor: AppColors.appPrimary,
                  selectedColor: AppColors.appPrimary,
                  activeFillColor: AppColors.appPrimary,
                  inactiveFillColor: AppColors.appPrimary,
                  selectedFillColor: AppColors.appPrimary,
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
                        Get.to(() => NewPasswordPage());
                      },
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
