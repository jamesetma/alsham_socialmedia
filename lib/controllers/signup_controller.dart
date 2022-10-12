import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  late GlobalKey numberKey;
  late TextEditingController numberController;

  @override
  void onInit() {
    numberKey = GlobalKey<FormState>();
    numberController = TextEditingController();
    super.onInit();
  }
}
