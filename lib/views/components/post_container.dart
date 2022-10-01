import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: AppColors.gray, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: null,
            ),
            Text('Seveen'),
          ],
        ),
        Text('shfliugfiluer'),
      ]),
    );
  }
}
