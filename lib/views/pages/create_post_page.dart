import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/textbox_builder.dart';
import 'package:alsham_socialmedia/views/components/textfield_builder.dart';
import 'package:flutter/material.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Post',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: Paddings.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text('Select image'),
            ),
            ButtonBuilder(
              textColor: Colors.black,
              text: 'upload image',
              onPressed: () {},
              color: AppColors.appPrimary,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text('Add caption'),
            ),
            const TextBoxBuilder(),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text('Add hastags'),
            ),
            const TextFieldBuilder(),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ButtonBuilder(
                onPressed: () {},
                color: AppColors.appPrimary,
                text: 'upload',
              ),
            )
          ],
        ),
      ),
    );
  }
}
