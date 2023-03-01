import 'dart:convert';

import 'package:alsham_socialmedia/customfullscreendialog.dart';
import 'package:alsham_socialmedia/models/account_model.dart';
import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:alsham_socialmedia/services/api.dart';
import 'package:alsham_socialmedia/services/api_service.dart';
import 'package:alsham_socialmedia/views/pages/landing_page.dart';
import 'package:alsham_socialmedia/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool loading = false.obs;
  late Map<String, dynamic> bodie;
  RxList<StudentModel> listStudentModels = <StudentModel>[].obs;
  var studentModel = StudentModel().obs;
  Map account = {};
  @override
  TextEditingController studentName = TextEditingController();
  TextEditingController studentUniNumber = TextEditingController();
  TextEditingController studentAcademicYear = TextEditingController();
  TextEditingController studentPhone = TextEditingController();
  TextEditingController studentBiography = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  late String body;

  // SplashController splashController = Get.put(SplashController());

  login() async {
    try {
      ApiService api = ApiService(
          url: 'auth/',
          body: (<String, String>{
            "username": username.text,
            "password": password.text
          }));
      return api.loginStudent().then((value) {
        json.decode(
          value.body,
          reviver: (key, value) => account.addAll({key: value}),
        );

        // List<AccountModel> acc = AccountModelFromJson(body);
        print(account['userID']);
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
        print(body);
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

  Future<StudentModel> getStudent() async {
    print("the user id is ${account['userID']}");
    ApiService api = ApiService(
      url: 'students/id?id=',
    );
    return await api
        .getCurrentStudent(account["userID"].toString())
        .catchError((e) => throw e);
  }

  void fetchStudents() async {
    HttpConnect request = HttpConnect(url: "students/");
    await request.list().then((value) {
      if (value.statusCode == 200) {
        final responseJson = jsonDecode(value.body);
        List jsonResponse = responseJson;
        listStudentModels.value = jsonResponse
            .map((e) => StudentModel.fromJson(e))
            .toList();
        print("LIST");
        print(body);
      } else {
        print('LIST ERROR');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void deleteStudent(int id) async {
    HttpConnect request = HttpConnect(
        url: 'students/',
        body: jsonEncode(<String, int>{"userID": account['userID']}));
    await request.delete().then((value) {
      bodie = jsonDecode(value.body);
      if (value.statusCode == 201) {
        print("DELETE");
        print(bodie);
      } else {
        print(value.statusCode.toString());
        // print(body);
      }
    }).catchError((onError) {
      printError();
    });
  }

  void editStudent(int id) async {
    HttpConnect request = HttpConnect(
      url: 'students/',
      body: jsonEncode(
        <String, dynamic>{
          studentName.text.isNotEmpty
              ? "student_name"
              : studentName.text: null,
          studentUniNumber.text.isNotEmpty
              ? "university_number"
              : studentUniNumber.text: null,
          studentAcademicYear.text.isNotEmpty
              ? "academic_year"
              : studentAcademicYear.text: null,
          studentPhone.text.isNotEmpty ? "phone" : studentPhone.text:
              null,
          studentBiography.text.isNotEmpty
              ? "biography"
              : studentBiography.text: null
        },
      ),
    );

    request.edit().then((value) {
      bodie = jsonDecode(value.body);
      if (value.statusCode == 200) {
        print("EDIT");
        print(bodie);
        Get.back();
      } else {
        print('EDIT ERROR');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void createStudent() async {
    print(studentName.text);
    print(studentUniNumber.text);
    print(account["userID"]);
    ApiService api = ApiService(
        url: "students/",
        body: (<String, dynamic>{
          "student_name": studentName.text,
          "phone": "123",
          'academic_year': '4th',
          "university_number": studentUniNumber.text,
          "userID": json.encode(account['userID'])
        }));
    api.createStudent().catchError((e) => throw e);
  }

  void logout() async {
    CustomFullScreenDialog.showDialog();

    ///
    CustomFullScreenDialog.cancelDialog();
    Get.offAll(() => LoginPage());
    // Get.offAll(() => const SigninView());
  }
}
