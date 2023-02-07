import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/controllers/landingpage_controller.dart';
import 'package:alsham_socialmedia/views/pages/announcements_page.dart';
import 'package:alsham_socialmedia/views/pages/chat_page.dart';
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
            children: [
              HomePage(),
              AnnouncementsPage(),
              ChatPage(),
              MyProfilePage()
            ]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              onTap: (index) {
                controller.changeTabIndex(index);
              },
              currentIndex: controller.currentIndex.value,
              iconSize: 30,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              unselectedItemColor: Colors.grey,
              selectedItemColor: AppColors.appPrimary,
              items: const [
                BottomNavigationBarItem(
                  label: 'Inqueries',
                  icon: Icon(IconlyLight.user),
                  activeIcon: Icon(IconlyBold.user_2),
                ),
                BottomNavigationBarItem(
                  label: 'Announcments',
                  icon: Icon(IconlyLight.notification),
                  activeIcon: Icon(IconlyBold.notification),
                ),
                BottomNavigationBarItem(
                  label: 'Chat',
                  icon: Icon(IconlyLight.chat),
                  activeIcon: Icon(IconlyBold.chat),
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
