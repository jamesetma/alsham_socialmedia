import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  // RxInt seveen = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            // onTap: (val) {
            //   seveen.value = val;
            // },
            iconSize: 30,
            // currentIndex: seveen.value,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedItemColor: AppColors.appPrimary,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(IconlyLight.home),
                activeIcon: Icon(IconlyBold.home),
              ),
              BottomNavigationBarItem(
                label: 'Add',
                icon: Icon(IconlyLight.plus),
                activeIcon: Icon(IconlyBold.plus),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(IconlyLight.profile),
                activeIcon: Icon(IconlyBold.profile),
              ),
            ]),
      ),
    );
  }
}
