// import 'package:alsham_socialmedia/constants/app_colors.dart';
// import 'package:alsham_socialmedia/controllers/auth_controller.dart';
// import 'package:alsham_socialmedia/controllers/student_controller.dart';
// import 'package:alsham_socialmedia/models/student_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);
//   // AuthController auth = Get.find<AuthController>();
//   StudentController controller = Get.find<StudentController>();
//   AuthController auth = Get.find<AuthController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         elevation: 0,
//       ),
//       body: FutureBuilder(
//         future: controller.getStudent(),
//         builder: (context, AsyncSnapshot<StudentModel> snapshot) {
//           var student = snapshot.data;
//           return student == null
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListTile(
//                   title: Text(student.studentName!),
//                   subtitle: Text(student.academicYear!),
//                 );
//         },
//       ),
//     );
//   }
// }
