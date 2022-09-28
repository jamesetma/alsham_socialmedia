import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldBuilder extends StatelessWidget {
  final bool? obsecureText;
  final Icon? prefixIcon;
  const TextFieldBuilder({
    Key? key,
    this.obsecureText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: obsecureText ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.only(bottom: 6, left: 10),
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
