import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownMenu extends StatelessWidget {
  DropDownMenu({
    Key? key,
    required this.currentValue,
    required this.items,
  }) : super(key: key);

  String currentValue;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 3,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.gray),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            elevation: 1,
            value: currentValue,
            borderRadius: BorderRadius.circular(10),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (value) {
              currentValue = value!;
            }),
      ),
    );
  }
}
