import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonBuilder extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final Image? icon;
  final String? text;
  final TextStyle? textStyle;
  const ButtonBuilder(
      {Key? key,
      this.onPressed,
      this.child,
      this.color,
      this.icon,
      this.text,
      this.textColor,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      height: 30,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      onPressed: onPressed,
      color: color,
      disabledColor: onPressed != null ? null : AppColors.gray,
      child: child ??
          Container(
            padding: EdgeInsets.symmetric(vertical: Get.height / 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: Get.height / 35,
                  child: icon ?? const SizedBox(),
                ),
                Text(
                  text ?? "",
                  style: textStyle ??
                      TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: textColor ?? AppColors.black),
                ),
                const SizedBox(),
              ],
            ),
          ),
    );
  }
}
