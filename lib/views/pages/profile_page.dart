// import 'package:alsham_socialmedia/constants/app_colors.dart';
// import 'package:alsham_socialmedia/constants/paddings.dart';
// import 'package:alsham_socialmedia/views/components/button_builder.dart';
// import 'package:alsham_socialmedia/views/components/post_container.dart';
// import 'package:flutter/material.dart';
// import 'package:iconly/iconly.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         elevation: 0,
//         leading: const BackButton(color: Colors.black),
//         centerTitle: true,
//         title: const Text(
//           'Profile',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: Paddings.bothPadding,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(children: [
//                     const CircleAvatar(),
//                     SizedBox(
//                       width: 8,
//                     ),
//                     const Text('Name'),
//                   ]),
//                   SizedBox(
//                     width: 25,
//                     child: IconButton(
//                       icon: const Icon(Icons.more_vert),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Flexible(
//                     child: Text(
//                       'hello my name is salah and I study computer engineering at the university',
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(IconlyLight.chat),
//                       ),
//                       SizedBox(
//                         height: 30,
//                         child: ButtonBuilder(
//                           textStyle: const TextStyle(
//                               fontSize: 12, color: AppColors.white),
//                           onPressed: () {},
//                           text: 'Follow',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const Divider(),
//               PostContainer(),
//               const Divider(),
//               PostContainer(),
//               const Divider(),
//               PostContainer(),
//               const Divider(),
//               PostContainer(),
//               const Divider(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
