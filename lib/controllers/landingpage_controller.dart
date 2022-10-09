import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LandingPageController extends GetxController {
  late PageController pageController;
  RxInt currentIndex = 0.obs;
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  void changeTabIndex(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(currentIndex.value);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
