import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/post_container.dart';
import 'package:alsham_socialmedia/views/pages/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Paddings.bothPadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: const [
                    CircleAvatar(),
                    SizedBox(
                      width: 12,
                    ),
                    Text('Name'),
                  ]),
                  SizedBox(
                    // width: 25,
                    child: IconButton(
                      icon: const Icon(IconlyLight.setting),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'hello my name is salah and I study computer engineering at the university',
                ),
              ),
              SizedBox(
                height: 40,
                child: ButtonBuilder(
                  textStyle:
                      TextStyle(fontSize: 14, color: AppColors.white),
                  onPressed: () {
                    Get.to(() => EditPage());
                  },
                  text: 'Edit Profile',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
