import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/textbox_builder.dart';
import 'package:alsham_socialmedia/views/components/textfield_builder.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: Paddings.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 40,
                    ),
                    Icon(Icons.camera_alt),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Seveen Shaheen'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Username'),
            ),
            TextFieldBuilder(),
            Text('Region'),
            TextFieldBuilder(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Phone number'),
                      TextFieldBuilder(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gender'),
                      TextFieldBuilder(),
                    ],
                  ),
                ),
              ],
            ),
            Text('About'),
            TextBoxBuilder(),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonBuilder(
                text: 'Update',
                onPressed: () {},
                color: AppColors.appPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
