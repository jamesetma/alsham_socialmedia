import 'dart:convert';

import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:alsham_socialmedia/services/api_service.dart';
import 'package:alsham_socialmedia/views/pages/landing_page.dart';
import 'package:alsham_socialmedia/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  RxBool loading = false.obs;
  late Map<String, dynamic> bodie;
  RxList<StudentModel> listStudentModels = <StudentModel>[].obs;
  var studentModel = StudentModel().obs;
  Map account = {};
  String myToken = '';

  late TextEditingController username;
  late TextEditingController password;
  late SharedPreferences prefs;
  @override
  void onInit() async {
    username = TextEditingController();
    password = TextEditingController();
    prefs = await SharedPreferences.getInstance();
    super.onInit();
  }

  late String body;

  Future login() async {
    try {
      // print(username.text + password.text);
      ApiService api = ApiService(
          url: 'auth/',
          body: ({
            "username": username.text,
            "password": password.text
          }));
      return await api.loginStudent().then((value) async {
        // print(value.body);
        if (value.statusCode == 200) {
          await json.decode(
            value.body,
            reviver: (key, value) => account.addAll({key: value}),
          );
          // await prefs.setString("token", account['accessToken']);
          // await prefs.setBool("isLoggedIn", true);

          // print(account["accessToken"]);
        }
      });
    } catch (e) {
      print('erroooooooor');
      print(e.toString());
    }
  }

  Future<http.Response> signup() async {
    try {
      ApiService api = ApiService(
          url: 'register/',
          body: (<String, dynamic>{
            "username": username.text,
            "password": password.text
          }));
      return await api.signupStudent().then((value) {
        // body = value.body;

        if (value.statusCode == 200) {
          // Get.offAll(() => LandingPage());
          return value;
        } else {
          print('ERROR');
          throw -1;
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      throw e;
    }
  }

  // checkLogin() async {
  //   myToken = prefs.getString('token')!;
  //   final decodedToken = JwtDecoder.decode(myToken);

  //   print(decodedToken['username']);
  //   return decodedToken['username'];
  // }

  void logout() {
    Get.offAll(LoginPage());
  }
}
