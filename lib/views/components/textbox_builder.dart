import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextBoxBuilder extends StatelessWidget {
  const TextBoxBuilder({Key? key, this.controller}) : super(key: key);

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 5,
      child: TextFormField(
        controller: controller,
        expands: true,
        maxLines: null,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.gray,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
