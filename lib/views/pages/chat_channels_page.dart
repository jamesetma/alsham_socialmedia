// import 'package:alsham_socialmedia/controllers/channel_controller.dart';
// import 'package:alsham_socialmedia/customfullscreendialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sendbird_sdk/constant/enums.dart';
// import 'package:sendbird_sdk/core/channel/group/group_channel.dart';
// import 'package:sendbird_sdk/core/models/user.dart';
// import 'package:sendbird_sdk/handlers/channel_event_handler.dart';
// import 'package:sendbird_sdk/query/channel_list/group_channel_list_query.dart';
// import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';

// class ChatChannelPage extends StatefulWidget {
//   ChatChannelPage({super.key});

//   @override
//   State<ChatChannelPage> createState() => _ChatChannelPageState();
// }

// class _ChatChannelPageState extends State<ChatChannelPage>
//     with ChannelEventHandler {
//   ChannelController controller = Get.put(ChannelController());
//   @override
//   void initState() {
//     SendbirdSdk().addChannelEventHandler('chat_channel_page', this);
//     super.initState();
//   }

//   Future<List<GroupChannel>> getGroupChannels() async {
//     try {
//       final query = GroupChannelListQuery()
//         ..includeEmptyChannel = true
//         ..order = GroupChannelListOrder.latestLastMessage
//         ..limit = 15;
//       return await query.loadNext();
//     } catch (e) {
//       print('getGroupChannels: ERROR: $e');
//       return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Channels'), actions: [
//         IconButton(
//             onPressed: () {
//               controller.getUsers();
//               showModalBottomSheet(
//                   context: context, builder: displayUsers);
//             },
//             icon: Icon(Icons.person_add)),
//         IconButton(
//             onPressed: () {
//               if (controller.selectedUsers.toList().isEmpty) {
//                 // Don't create a channel if there isn't another user selected
//                 return;
//               }
//               controller.createChannel([
//                 for (final user in controller.selectedUsers.toList())
//                   user.userId
//               ]);
//             },
//             icon: Icon(Icons.add))
//       ]),
//       body: FutureBuilder(
//         future: getGroupChannels(),
//         builder:
//             (context, AsyncSnapshot<List<GroupChannel>?> snapshot) {
//           if (snapshot.hasData == false || snapshot.data == null) {
//             return Center(
//               child:
//                   Container(child: const Text('no channels yet...')),
//             );
//           }
//           List<GroupChannel> channels = snapshot.data!;
//           return ListView.builder(
//               itemCount: channels.length,
//               itemBuilder: (context, index) {
//                 GroupChannel channel = channels[index];
//                 return ListTile(
//                   // Display all channel members as the title
//                   title: Text(
//                     [
//                       for (final member in channel.members)
//                         member.nickname
//                     ].join(", "),
//                   ),
//                   // Display the last message presented
//                   subtitle: Text(channel.lastMessage?.message ?? ''),
//                   onTap: () {
//                     // gotoChannel(channel.channelUrl);
//                   },
//                 );
//               });
//         },
//       ),
//     );
//   }

//   Widget displayUsers(BuildContext context) {
//     return ListView.builder(
//         itemCount: controller.availableUsers.length,
//         itemBuilder: (context, index) {
//           Rx<User> user = controller.availableUsers[index].obs;
//           return Obx(() {
//             return CheckboxListTile(
//               title: Text(
//                   user.value.nickname.isEmpty
//                       ? user.value.userId
//                       : user.value.nickname,
//                   style: TextStyle(color: Colors.black)),
//               controlAffinity: ListTileControlAffinity.platform,
//               value: controller.selectedUsers.contains(user),
//               // value: SendbirdSdk().currentUser.userId == user.userId,
//               activeColor: Theme.of(context).primaryColor,
//               onChanged: (bool? value) {
//                 // Using a set to store which users we want to create
//                 // a channel with.

//                 if (value!) {
//                   controller.selectedUsers.add(user);
//                 } else {
//                   controller.selectedUsers.remove(user);
//                 }
//                 print(
//                     'create_channel_view: on change for: ${user.value.nickname} _selectedUsers: ${controller.selectedUsers}');
//               },
//               secondary: user.value.profileUrl!.isEmpty
//                   ? CircleAvatar(
//                       child: Text(
//                       (user.value.nickname.isEmpty
//                               ? user.value.userId
//                               : user.value.nickname)
//                           .substring(0, 1)
//                           .toUpperCase(),
//                     ))
//                   : CircleAvatar(
//                       backgroundImage:
//                           NetworkImage(user.value.profileUrl!),
//                     ),
//             );
//           });
//         });
//   }
// }
