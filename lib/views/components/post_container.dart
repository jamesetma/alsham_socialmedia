import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class PostContainer extends StatelessWidget {
  final String? imageLink;
  const PostContainer({Key? key, this.imageLink}) : super(key: key);

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
          children: const [
            CircleAvatar(
              backgroundImage: null,
            ),
            Text(
              'Seveen',
            ),
          ],
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('shfliugfiluer ich bin blyat'),
        ),
        imageLink == null
            ? const SizedBox()
            : SizedBox(
                height: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network('', fit: BoxFit.cover),
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(IconlyLight.heart),
            ),
            const Text('200'),
            IconButton(
              onPressed: () {},
              icon: const Icon(IconlyBold.chat),
            ),
            const Text('50'),
          ],
        )
      ]),
    );
  }
}
