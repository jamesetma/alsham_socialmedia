import 'dart:convert';
import 'dart:io';

import 'package:alsham_socialmedia/controllers/splash_controller.dart';
import 'package:alsham_socialmedia/customfullscreendialog.dart';
import 'package:alsham_socialmedia/services/api_service.dart';
import 'package:alsham_socialmedia/views/pages/landing_page.dart';
import 'package:alsham_socialmedia/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

class AuthController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  late String body;

  SplashController splashController = Get.put(SplashController());

  login() async {
    try {
      ApiService api = ApiService(
          url: 'auth/',
          body: (<String, String>{
            "username": username.text,
            "password": password.text
          }));
      return api.loginStudent().then((value) {
        body = jsonEncode(value.body);
        if (value.statusCode == 200) {
          Get.offAll(() => LandingPage());
        } else {
          print('ERROR');
          print(body);
        }
      });
    } catch (e) {
      print('erroooooooor');
      print(e.toString());
    }
  }

  signup() async {
    try {
      ApiService api = ApiService(
          url: 'register/',
          body: (<String, dynamic>{
            "username": username.text,
            "password": password.text
          }));
      api.signupStudent().then((value) {
        body = value.body;
        if (value.statusCode == 200) {
          Get.offAll(() => LandingPage());
        } else {
          print('ERROR');
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void logout() async {
    CustomFullScreenDialog.showDialog();

    ///
    CustomFullScreenDialog.cancelDialog();
    Get.offAll(() => LoginPage());
    // Get.offAll(() => const SigninView());
  }
}
