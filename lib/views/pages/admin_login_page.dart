import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/customfullscreendialog.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/textfield_builder.dart';
import 'package:alsham_socialmedia/views/pages/landing_page.dart';
import 'package:alsham_socialmedia/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginPage extends StatelessWidget {
  AdminLoginPage({super.key});
  final AuthController auth = Get.put(AuthController());
  // final StudentController studentController =
  //     Get.put(StudentController());`
  final role = 1;
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
              'Sign In as Admin',
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
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: TextButton(
            //     onPressed: () {
            //       Get.to(() => ForgotPassword());
            //     },
            //     child: const Text('Forgot Password?'),
            //   ),
            // ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ButtonBuilder(
                    text: 'Sign In',
                    color: AppColors.appPrimary,
                    onPressed: () async {
                      CustomFullScreenDialog.showDialog();
                      await auth.login().then((value) {
                        Get.offAll(() => LandingPage(),
                            arguments: role);
                        CustomFullScreenDialog.cancelDialog();
                      });
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    Get.to(() => LoginPage());
                  },
                  child: Text('Student? Login here')),
            )
          ],
        ),
      ),
    );
  }
}
