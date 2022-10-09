import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/controllers/landingpage_controller.dart';
import 'package:alsham_socialmedia/views/pages/create_post_page.dart';
import 'package:alsham_socialmedia/views/pages/home_page.dart';
import 'package:alsham_socialmedia/views/pages/my_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  LandingPageController controller = Get.put(LandingPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
            controller: controller.pageController,
            physics: const ScrollPhysics(
              parent: NeverScrollableScrollPhysics(),
            ),
            children: const [
              HomePage(),
              CreatePostPage(),
              MyProfilePage()
            ]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              onTap: (val) {
                controller.currentIndex.value = val;
                controller.pageController
                    .jumpToPage(controller.currentIndex.value);
              },
              currentIndex: controller.currentIndex.value,
              iconSize: 30,
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
      ),
    );
  }
}
