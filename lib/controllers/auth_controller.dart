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
  late TextEditingController studentName;
  late TextEditingController studentUniNumber;
  late TextEditingController studentAcademicYear;
  late TextEditingController studentPhone;
  late TextEditingController studentBiography;
  late TextEditingController username;
  late TextEditingController password;
  @override
  void onInit() {
    studentName = TextEditingController();
    studentUniNumber = TextEditingController();
    studentAcademicYear = TextEditingController();
    studentPhone = TextEditingController();
    studentBiography = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();
    // fetchStudents();
    super.onInit();
  }

  late String body;

  login() async {
    try {
      // print(username.text + password.text);
      ApiService api = ApiService(
          url: 'auth/',
          body: ({
            "username": username.text,
            "password": password.text
          }));
      return api.loginStudent().then((value) {
        // print(value.body);
        if (value.statusCode == 200) {
          Get.offAll(() => LandingPage());
          json.decode(
            value.body,
            reviver: (key, value) => account.addAll({key: value}),
          );
          // print(account["accessToken"]);
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
      accessToken: account["accessToken"],
      url: 'students/id?id=',
    );
    return await api
        .getCurrentStudent(account["userID"].toString())
        .catchError((e) => throw e);
  }

  void fetchStudents() async {
    ApiService api = ApiService(url: "students/");
    listStudentModels.value = await api.fetchStudents();
  }

  void deleteStudent(int id) async {
    ApiService api = ApiService(
      url: 'students/',
      body: (<String, int>{"userID": account['userID']}),
    );
    await api.deleteStudent().then((value) {
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
    Map<String, dynamic> map = <String, dynamic>{
      "userID": json.encode(id),
      "student_name": studentName.text,
      "academic_year": studentAcademicYear.text,
      "phone": studentPhone.text,
      "biography": studentBiography.text
    };
    ApiService api = ApiService(
        url: 'students/',
        body: mapToQuery(map, encoding: utf8),
        accessToken: account['accessToken']);
    print(mapToQuery(map, encoding: utf8).toString());
    api.editStudent().whenComplete(() {
      update(['myProfile']);
      getStudent();
    }).catchError((e) {
      throw e;
    });
  }

  mapToQuery(Map<String, dynamic> map, {required Encoding encoding}) {
    map.keys
        .where((k) => (map[k] == null || map[k] == ''))
        .toList() // -- keys for null elements
        .forEach(map.remove);

    // var pairs = <List<String>>[];
    // map.forEach((key, value) => pairs.add([
    //       Uri.encodeQueryComponent(key, encoding: encoding),
    //       Uri.encodeQueryComponent(value, encoding: encoding)
    //     ]));

    return map;
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
