import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/textfield_builder.dart';
import 'package:alsham_socialmedia/views/pages/forgot_password.dart';
import 'package:alsham_socialmedia/views/pages/welcomeback_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final AuthController auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: Paddings.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const Text('Enter your credentials'),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Username'),
            ),
            TextFieldBuilder(controller: auth.username),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Password'),
            ),
            TextFieldBuilder(
              obsecureText: true,
              controller: auth.password,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.to(() => ForgotPassword());
                },
                child: const Text('Forgot Password?'),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ButtonBuilder(
                    text: 'Sign In',
                    color: AppColors.appPrimary,
                    onPressed: () {
                      auth.login();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
