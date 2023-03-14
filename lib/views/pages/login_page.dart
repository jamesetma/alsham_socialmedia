import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/customfullscreendialog.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/textfield_builder.dart';
import 'package:alsham_socialmedia/views/pages/admin_login_page.dart';
import 'package:alsham_socialmedia/views/pages/forgot_password.dart';
import 'package:alsham_socialmedia/views/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final role = 0;

  LoginPage({super.key});
  final AuthController auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: Paddings.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign In as Student',
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ButtonBuilder(
                    text: 'Sign In',
                    color: AppColors.appPrimary,
                    onPressed: () async {
                      var res;
                      CustomFullScreenDialog.showDialog();
                      res = await auth.login().then((value) {
                        return value;
                      });
                      if (res.statusCode == 200) {
                        Get.offAll(() => LandingPage());
                        CustomFullScreenDialog.cancelDialog();
                      } else
                        CustomFullScreenDialog.cancelDialog();
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    auth.username.text = '';
                    auth.password.text = '';
                    Get.to(() => AdminLoginPage());
                  },
                  child: const Text('Admin? Login here')),
            )
          ],
        ),
      ),
    );
  }
}
