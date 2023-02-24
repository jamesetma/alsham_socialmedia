// import 'dart:convert';

// import 'package:alsham_socialmedia/models/student_model.dart';
// import 'package:alsham_socialmedia/services/api.dart';
// import 'package:alsham_socialmedia/services/api_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';

// class StudentController extends GetxController {
//   RxBool loading = false.obs;
//   List<StudentModel> students = [];
//   late Map<String, dynamic> body;
//   RxList<StudentModel> listStudentModels = <StudentModel>[].obs;
//   var studentModel = StudentModel().obs;

//   TextEditingController studentName = TextEditingController();
//   TextEditingController studentUniNumber = TextEditingController();
//   TextEditingController studentAcademicYear = TextEditingController();
//   TextEditingController studentPhone = TextEditingController();
//   TextEditingController studentBiography = TextEditingController();
//   @override
//   void onInit() {
//     getStudents();
//     super.onInit();
//   }

//   void getStudents() async {
//     ApiService api = ApiService();
//     List<StudentModel> users = await api.fetchStudents();
//   }

//   void createStudent() async {
//     HttpConnect request = HttpConnect(
//       url: 'students/',
//       body: jsonEncode(
//         <String, dynamic>{
//           "student_name": studentName.text,
//           "university_number": studentUniNumber.text,
//         },
//       ),
//     );
//     await request.create().then((res) {
//       body = jsonDecode(res.body);
//       if (res.statusCode == 201) {
//         print("CREATED");
//         print(body);
//         Get.back();
//       } else {
//         print("CREATED ERROR");
//       }
//     }).catchError((onError) {
//       print('fuck this shit');
//       printError();
//     });
//   }
// }
