import 'dart:convert';

import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:alsham_socialmedia/services/api.dart';
import 'package:alsham_socialmedia/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentsController extends GetxController {
  RxBool loading = false.obs;
  late Map<String, dynamic> body;
  RxList<StudentModel> listStudentModels = <StudentModel>[].obs;
  var studentModel = StudentModel().obs;

  TextEditingController studentName = TextEditingController();
  TextEditingController studentUniNumber = TextEditingController();
  TextEditingController studentAcademicYear = TextEditingController();
  TextEditingController studentPhone = TextEditingController();
  TextEditingController studentBiography = TextEditingController();

  // TextEditingController editIdController = TextEditingController();
  // TextEditingController editTitleController = TextEditingController();
  // TextEditingController editBodyController = TextEditingController();
  // TextEditingController editUserIdController =
  //     TextEditingController();

  RxInt StudentModelId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getStudents();
  }

  // void toEditPage() async {
  //   Get.to(() => EditPage());
  // }

  // void toDetailPage() async {
  //   Get.to(() => DetailPage());
  // }

  void getStudents() async {
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

  // void detail(int id) async {
  //   HttpConnect request = HttpConnect(url: 'StudentModels/$id/');
  //   request.detail().then((value) {
  //     body = jsonDecode(value.body);
  //     if (value.statusCode == 200) {
  //       StudentModelDetail.value = StudentModel.fromJson(body);
  //       print("DETAIL");
  //       print(body);
  //     } else {
  //       print('DETAIL ERROR');
  //     }
  //   }).catchError((onError) {
  //     printError();
  //   });
  // }

  void deleteStudent(int id) async {
    HttpConnect request = HttpConnect(
        url: 'students/',
        body: jsonEncode(<String, int>{"student_id": id}));
    await request.delete().then((value) {
      body = jsonDecode(value.body);
      if (value.statusCode == 201) {
        print("DELETE");
        print(body);
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
      body = jsonDecode(value.body);
      if (value.statusCode == 200) {
        print("EDIT");
        print(body);
        Get.back();
      } else {
        print('EDIT ERROR');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void createStudent() async {
    ApiService api = ApiService(
        url: "students/",
        body: (<String, dynamic>{
          "student_name": studentName.text,
          "university_number": studentUniNumber.text
        }));
    api.createStudent();
    // HttpConnect request = HttpConnect(
    //   url: 'students',
    //   body: jsonEncode(
    //     <String, dynamic>{
    //       "student_name": "Ivar",
    //       "university_number": studentUniNumber.text,
    //       "academic_year": studentAcademicYear.text,
    //       studentPhone.text.isNotEmpty ? "phone" : studentPhone.text:
    //           null,
    //       studentBiography.text.isNotEmpty
    //           ? "biography"
    //           : studentBiography.text: null
    //     },
    //   ),
    // );
    // await request.create().then((value) {
    //   var ss = jsonDecode(value.body);
    //   if (value.statusCode == 201) {
    //     print("CREATED");
    //     print(body);
    //     Get.back();
    //   } else {
    //     print(value.statusCode.toString());
    //   }
    // }).catchError((onError) {
    //   printError();
    // });
  }
}
