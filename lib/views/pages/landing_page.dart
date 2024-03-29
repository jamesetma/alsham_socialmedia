import 'package:alsham_socialmedia/constants/app_colors.dart';
import 'package:alsham_socialmedia/controllers/landingpage_controller.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/views/pages/all_chats_page.dart';
import 'package:alsham_socialmedia/views/pages/announcements_page.dart';
import 'package:alsham_socialmedia/views/pages/inqueries_page.dart';
import 'package:alsham_socialmedia/views/pages/lectures_page.dart';
import 'package:alsham_socialmedia/views/pages/my_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  LandingPageController controller = Get.put(LandingPageController());
  StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    studentController.role = Get.arguments ?? 0;
    return SafeArea(
      child: Scaffold(
        body: PageView(
            controller: controller.pageController,
            physics: const ScrollPhysics(
              parent: NeverScrollableScrollPhysics(),
            ),
            children: [
              InqueriesPage(),
              AnnouncementsPage(),
              LecturesPage(),
              AllChatsPage(),
              const MyProfilePage()
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
                  label: 'Lectures',
                  icon: Icon(IconlyLight.bookmark),
                  activeIcon: Icon(IconlyBold.bookmark),
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
