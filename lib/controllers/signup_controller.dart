import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sendbird_sdk/core/models/user.dart';
import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';

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
