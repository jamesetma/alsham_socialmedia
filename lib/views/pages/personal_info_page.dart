import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/dropdown_menu_builder.dart';
import 'package:alsham_socialmedia/views/components/textbox_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoPage extends StatelessWidget {
  PersonalInfoPage({Key? key}) : super(key: key);

  var currentValue = 'Male'.obs;
  List<String> genders = ['Male', 'Female'];

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
              'Personal Information',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const Text('Please fill the following'),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Full Name'),
            ),
            const TextFieldBuilder(),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Email Address'),
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.gray,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropDownMenu(
                      currentValue: currentValue, items: genders),
                  DropDownMenu(
                      currentValue: currentValue, items: genders),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('About'),
            ),
            const TextBoxBuilder(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ButtonBuilder(
                    text: 'Next',
                    color: AppColors.appPrimary,
                    onPressed: () {},
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

class TextFieldBuilder extends StatelessWidget {
  const TextFieldBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
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
