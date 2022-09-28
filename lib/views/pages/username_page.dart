import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/textfield_builder.dart';
import 'package:alsham_socialmedia/views/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: Paddings.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Username',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text('Help secure your account'),
            Text('Username'),
            TextFieldBuilder(),
            Text('password'),
            TextFieldBuilder(
              obsecureText: true,
            ),
            Text('Confirm Password'),
            TextFieldBuilder(
              obsecureText: true,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ButtonBuilder(
                    text: 'Done',
                    color: AppColors.appPrimary,
                    onPressed: () {
                      Get.to(() => WelcomePage());
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
