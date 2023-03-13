import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final String? imageLink;
  final String name;

  final String caption;
  const PostContainer(
      {Key? key,
      this.imageLink,
      required this.caption,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: null,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              name,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(caption, softWrap: true),
        ),
        imageLink == null
            ? const SizedBox()
            : SizedBox(
                height: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(imageLink!, fit: BoxFit.cover),
                ),
              ),
      ]),
    );
  }
}
