// // import 'package:auto_size_text/auto_size_text.dart';
// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:alsham_socialmedia/constants/paddings.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:timeago/timeago.dart' as timeago;
// // import 'package:mash_app/app/data/constants/app_colors.dart';

// // import 'package:mash_app/app/data/constants/paddings.dart';
// // import 'package:mash_app/app/data/constants/text_styles.dart';
// // import 'package:mash_app/app/modules/chatslikes/controllers/chatslikes_controller.dart';
// // import 'package:mash_app/app/routes/app_pages.dart';
// // import 'package:mash_app/app/services/navigate.dart';
// // import 'package:percent_indicator/percent_indicator.dart';

// class ChatsListTile extends StatelessWidget {
//   final String imageUrl;
//   final String userId;
//   final String? status;
//   final String name;
//   final String age;
//   final String lastMessage;
//   // final Timestamp lastMessageTimestamp;
//   final String mode;

//   const ChatsListTile({
//     Key? key,
//     required this.imageUrl,
//     required this.userId,
//     this.status,
//     required this.name,
//     required this.age,
//     required this.lastMessage,
//     // required this.lastMessageTimestamp,
//     required this.mode,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: Paddings.topPadding,
//       child: GestureDetector(
//         onTap: () {
          
//         },
//         child: Row(
//           children: [
//             Stack(
//               children: [
//                 CachedNetworkImage(
//                   imageUrl: imageUrl,
//                   placeholder: (context, url) => SizedBox(
//                       height: Get.width / 5,
//                       width: Get.width / 5,
//                       child: CircularProgressIndicator(
//                         color: mode == "Dating"
//                             ? AppColors.datingPrimary
//                             : mode == "Friends"
//                                 ? AppColors.friendsPrimary
//                                 : AppColors.culturalPrimary,
//                       )),
//                   imageBuilder: (context, imageProvider) => Container(
//                     height: Get.width / 5,
//                     width: Get.width / 5,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: imageProvider,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: CircularPercentIndicator(
//                       radius: Get.width / 10,
//                       fillColor: Colors.transparent,
//                       backgroundColor: Colors.transparent,
//                       percent: 0.4,
//                       progressColor: mode == "Dating"
//                           ? AppColors.datingPrimary
//                           : mode == "Friends"
//                               ? AppColors.friendsPrimary
//                               : AppColors.culturalPrimary,
//                       startAngle: 108,
//                       circularStrokeCap: CircularStrokeCap.round,
//                       lineWidth: 6,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   right: Get.width / 100,
//                   top: Get.width / 100,
//                   child: Container(
//                     padding: const EdgeInsets.all(7),
//                     decoration: BoxDecoration(
//                         border: Border.all(width: 1, color: Colors.white),
//                         borderRadius: BorderRadius.circular(90.0),
//                         color: status?.toLowerCase() != "online"
//                             ? AppColors.gray3
//                             : AppColors.greenOnline),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(width: 13),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 LimitedBox(
//                   maxWidth: Get.width / 1.6,
//                   child: AutoSizeText.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                             text: name[0].toUpperCase() +
//                                 name.substring(1, name.length)),
//                         TextSpan(
//                           text: ", $age",
//                         ),
//                       ],
//                       style: TextStyle(
//                           // fontSize: 22.5,
//                           fontSize: TextStyles.headerSize1 * 1.145,
//                           color: AppColors.black,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: "Inter"),
//                     ),
//                   ),
//                 ),
//                 LimitedBox(
//                   maxWidth: Get.width / 1.5,
//                   child: AutoSizeText(
//                     "${lastMessage.length > 20 ? "${lastMessage.substring(0, 19)}..." : lastMessage}, ${timeago.format(lastMessageTimestamp.toDate())}",
//                     style: const TextStyle(
//                         fontSize: 15,
//                         color: AppColors.gray3,
//                         fontWeight: FontWeight.w100,
//                         fontFamily: "Inter"),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }
