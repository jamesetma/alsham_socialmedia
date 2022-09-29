import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/textfield_builder.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          )),
      body: Padding(
        padding: Paddings.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Forgot Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Text('Let\'s help recover your account'),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('username'),
            ),
            TextFieldBuilder(),
            Text('Email'),
            TextFieldBuilder(),
            Text('Phone Number'),
            TextFieldBuilder(),
            Text('Last Remembered Password'),
            TextFieldBuilder(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ButtonBuilder(
                    color: AppColors.appPrimary,
                    onPressed: () {},
                    text: 'Done',
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
