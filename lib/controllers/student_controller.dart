import 'dart:convert';

import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/controllers/tag_controller.dart';
import 'package:alsham_socialmedia/customfullscreendialog.dart';
import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:alsham_socialmedia/models/student_subject_model.dart';
import 'package:alsham_socialmedia/models/tag_model.dart';
import 'package:alsham_socialmedia/services/api_service.dart';
import 'package:alsham_socialmedia/views/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class StudentController extends GetxController {
  RxBool loading = false.obs;
  GlobalKey key1 = GlobalKey<FormState>();
  List<StudentModel> students = [];
  late Map<String, dynamic> body;
  List<StudentModel> listStudentModels = <StudentModel>[];
  var studentModel = StudentModel().obs;

  late AuthController auth;
  late TagController tagController;
  int studentId = 1;
  late List<StudentSubjectModel> studentSubjects = [];
  int role = -1;

  late TextEditingController studentName;
  late TextEditingController studentUniNumber;
  late TextEditingController studentAcademicYear;
  late TextEditingController studentPhone;
  late TextEditingController studentBiography;

  late TagModel selectedTag;
  String? tagName;
  setTagName(value) {
    tagName = value;
  }

  StudentModel student = StudentModel();

  @override
  void onInit() async {
    auth = Get.find<AuthController>();
    tagController = Get.find<TagController>();
    studentName = TextEditingController();
    studentUniNumber = TextEditingController();
    studentAcademicYear = TextEditingController();
    studentPhone = TextEditingController();
    studentBiography = TextEditingController();
    studentId = auth.account['userID'];
    student = await getStudent();

    await fetchStudents();
    studentSubjects.assignAll(await getStudentSubjects());

    super.onInit();
  }

  Future<List<StudentSubjectModel>> getStudentSubjects() async {
    ApiService api = ApiService(
      url: 'student_subject/',
      accessToken: auth.account["accessToken"],
    );

    return await api.fetchStudentSubjects(studentId.toString());
  }

  // getStudentSubjectName() {
  //   tagController.tags.firstWhere((element) => element.tagId ==studentSubjects[index].studentId)
  // }

  addStudentSubject() async {
    selectedTag = tagController.tags
        .firstWhere((element) => element.tagDescr == tagName);
    ApiService api = ApiService(
      url: 'student_subject/',
      accessToken: auth.account["accessToken"],
      body: (<String, dynamic>{
        "student_id": studentId.toString(),
        "tag_id": selectedTag.tagId.toString()
      }),
    );
    await api.create().then((value) {
      print('subject uploaded');
    });
  }

  Future<StudentModel> getStudent() async {
    ApiService api = ApiService(
      accessToken: auth.account["accessToken"],
      url: 'students/id?id=',
    );
    return await api
        .getCurrent(auth.account["userID"].toString())
        .catchError((e) => throw e);
  }

  fetchStudents() async {
    ApiService api = ApiService(
        url: "students/", accessToken: auth.account["accessToken"]);
    listStudentModels = await api.fetch().whenComplete(() {
      // print(listStudentModels.value.first.studentName);
      print("fetched STUDENTS");
    }) as List<StudentModel>;
  }

  late Map<String, dynamic> bodie;

  void deleteStudent(int id) async {
    ApiService api = ApiService(
        url: 'students/',
        body: (<String, int>{"userID": auth.account['userID']}),
        accessToken: auth.account['accessToken']);
    await api.delete().then((value) {
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

  void editStudent(int id, int? role) async {
    Map<String, dynamic> map = <String, dynamic>{
      "userID": json.encode(id),
      "student_name": studentName.text,
      "academic_year": studentAcademicYear.text,
      "phone": studentPhone.text,
      "biography": studentBiography.text,
      "role": role
    };
    ApiService api = ApiService(
        url: 'students/',
        body: mapToQuery(map),
        accessToken: auth.account['accessToken']);
    print(mapToQuery(map).toString());
    api.edit().whenComplete(() {
      update(['myProfile']);
      getStudent();
    }).catchError((e) {
      throw e;
    });
  }

  bool isAdmin() {
    if (role == 1) return true;
    return false;
  }

  mapToQuery(Map<String, dynamic> map) {
    map.keys
        .where((k) => (map[k] == null || map[k] == ''))
        .toList() // -- keys for null elements
        .forEach(map.remove);

    return map;
  }

  Future createStudent(String id) async {
    Map<String, dynamic> map = (<String, dynamic>{
      "student_name": studentName.text,
      "phone": studentPhone.text,
      'academic_year': studentAcademicYear.text,
      "university_number": studentUniNumber.text,
      "userID": id,
    });

    ApiService api = ApiService(
        url: "students/",
        accessToken: auth.account['accessToken'],
        body: mapToQuery(map));
    await api.create().catchError((e) => throw e);
  }

  void logout() {
    Get.offAll(() => LoginPage());
  }
}
