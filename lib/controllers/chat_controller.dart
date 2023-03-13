// import 'dart:convert';
// import 'package:alsham_socialmedia/constants/urls.dart';
// import 'package:alsham_socialmedia/controllers/student_controller.dart';
// import 'package:alsham_socialmedia/models/message_model.dart';
// import 'package:alsham_socialmedia/models/student_model.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:get/get.dart';
// import 'package:socket_io_client/socket_io_client.dart' as io;

// class ChatController extends GetxController {
//   late io.Socket socket;
//   RxList<ChatMessage> messagesList = RxList<ChatMessage>();

//   // AuthController auth = Get.find<AuthController>();
//   StudentController controller = Get.find<StudentController>();

//   late StudentModel student;
//   late DateTime estTime;

//   ChatUser user = ChatUser(id: '1');
//   @override
//   void onInit() async {
//     initializeDateFormatting();
//     initSocket();
//     student = await controller.getStudent();

//     user = ChatUser(
//       id: student.userId.toString(),
//       firstName: student.studentName,
//     );
//     // myChat = messagesList[0];
//     // user = myChat.user;

//     super.onInit();
//   }

//   initSocket() {
//     try {
//       List<MessageModel> msgs;

//       socket = io.io(URLS.apiURL2,
//           io.OptionBuilder().setTransports(['websocket']).build());
//       socket.connect();

//       socket.onConnect((_) {
//         print('connection established');
//       });

//       socket.on("messages", (messages) {
//         var json = jsonEncode(messages);

//         msgs = MessageModelFromJson(json);

//         for (int i = 0; i < msgs.length; i++) {
//           var time = DateTime.parse(msgs[i].created!);
//           ChatMessage msg = ChatMessage(
//               user: ChatUser(
//                   id: msgs[i].senderId!, firstName: msgs[i].sender),
//               text: msgs[i].message ?? 'hey',
//               createdAt: time);
//           messagesList.addIf(!messagesList.contains(msg), msg);
//         }
//         messagesList
//             .sort((a, b) => b.createdAt.compareTo(a.createdAt));
//         messagesList.refresh();
//       });

//       socket.on("message", (message) {
//         var json = jsonEncode(message);
//         Map<String, dynamic> map = jsonDecode(json);
//         MessageModel msgModel = MessageModel.fromJson(map);
//         // var localTime = DateFormat("yyyy-MM-ddTHH:mm:ss")
//         //     .parse(msgModel.created!, true);
//         var time = DateTime.parse(msgModel.created!);

//         ChatMessage msg = ChatMessage(
//             user: ChatUser(
//                 id: msgModel.senderId!, firstName: msgModel.sender),
//             createdAt: time,
//             text: msgModel.message!);
//         messagesList.add(msg);
//         messagesList
//             .sort((a, b) => b.createdAt.compareTo(a.createdAt));
//         messagesList.refresh();
//         print('sent/received message successfully!');
//       });
//       socket.onConnect((_) {
//         print('connection established');
//       });
//     } catch (e) {
//       print("error: $e");
//     }
//   }

//   // DateTime convertTimeStamp(int timestamp) {
//   //   var dateTime =
//   //       DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal();
//   //   // String convertedDateTime =
//   //   //     "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}-${dateTime.minute.toString().padLeft(2, '0')}";
//   //   return dateTime;
//   // }
// }
