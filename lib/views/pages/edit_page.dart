import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/constants/paddings.dart';
import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/components/textbox_builder.dart';
import 'package:alsham_socialmedia/views/components/textfield_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StudentModel student = Get.arguments;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                  leading: uploadImageButton(),
                  title: Text(student.studentName!)),
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
      ),
    );
  }
}

class uploadImageButton extends StatelessWidget {
  const uploadImageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 40,
        ),
        Icon(Icons.camera_alt),
      ],
    );
  }
}
