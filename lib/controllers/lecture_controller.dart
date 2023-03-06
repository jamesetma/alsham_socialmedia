import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LectureController extends GetxController {
  late TextEditingController lectureName;

  @override
  void onInit() {
    lectureName = TextEditingController();
    super.onInit();
  }
}
