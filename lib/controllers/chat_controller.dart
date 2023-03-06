import 'dart:convert';
import 'package:alsham_socialmedia/constants/urls.dart';
import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/models/message_model.dart';
import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:instant/instant.dart';

class ChatController extends GetxController {
  late io.Socket socket;
  RxList<ChatMessage> messagesList = RxList<ChatMessage>();

  AuthController auth = Get.find<AuthController>();

  late StudentModel student;
  late DateTime estTime;

  ChatUser user = ChatUser(id: '1');
  @override
  void onInit() async {
    estTime = curDateTimeByZone(zone: "PDT");

    initSocket();
    student = await auth.getStudent();

    user = ChatUser(
      id: student.userId.toString(),
      firstName: student.studentName,
    );
    // myChat = messagesList[0];
    // user = myChat.user;

    super.onInit();
  }

  initSocket() {
    try {
      List<MessageModel> msgs;

      socket = io.io(URLS.apiURL2,
          io.OptionBuilder().setTransports(['websocket']).build());
      socket.connect();

      socket.onConnect((_) {
        print('connection established');
      });

      socket.on("messages", (messages) {
        print("****************" + messages.toString());
        var json = jsonEncode(messages);
        msgs = MessageModelFromJson(json);
        for (int i = 0; i < msgs.length; i++) {
          messagesList.add(
            ChatMessage(
                user: ChatUser(
                    id: msgs[i].uid!, firstName: msgs[i].user),
                text: msgs[i].message ?? 'hey',
                createdAt: DateTime.now()),
          );
        }
      });

      socket.on("message", (message) {
        var json = jsonEncode(message);
        Map<String, dynamic> map = jsonDecode(json);
        MessageModel msgModel = MessageModel.fromJson(map);

        ChatMessage msg = ChatMessage(
            user:
                ChatUser(id: msgModel.uid!, firstName: msgModel.user),
            createdAt: DateTime.now(),
            text: msgModel.message!);
        messagesList.add(msg);

        print('sent message successfully!');
      });
      socket.onConnect((_) {
        print('connection established');
      });
    } catch (e) {
      print("error: $e");
    }
  }

  DateTime convertTimeStamp(int timestamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    // String convertedDateTime =
    //     "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}-${dateTime.minute.toString().padLeft(2, '0')}";
    return dateTime;
  }
}
