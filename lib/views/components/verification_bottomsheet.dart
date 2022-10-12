import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationBottomsheet extends StatelessWidget {
  final TextEditingController pinController;
  const VerificationBottomsheet(
      {super.key, required this.pinController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PinCodeTextField(
            enabled: true,
            controller: pinController,
            enableActiveFill: true,
            appContext: context,
            length: 6,
            animationType: AnimationType.fade,
            onChanged: (val) {},
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
          ButtonBuilder(
            text: 'Apply',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
