import 'dart:async';

import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/models/message_model.dart';
import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:alsham_socialmedia/services/api_service.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  late AuthController auth;
  ChatUser currentUser = ChatUser(id: '1');
  late StudentModel student;
  RxList<ChatMessage> messages = RxList<ChatMessage>();
  StudentController controller = Get.find<StudentController>();
  Timer? timer;
  String receiverId;
  ChatController({required this.receiverId});

  List<MessageModel?> msgs = [];
  List<MessageModel> newMsgs = [];
  @override
  void onInit() async {
    auth = Get.find<AuthController>();
    student = await controller.getStudent();

    currentUser = ChatUser(
      id: student.userId.toString(),
      firstName: student.studentName,
    );
    await getUserMessages(
        receiverId, auth.account['userID'].toString());
    await getUserMessages(
        auth.account['userID'].toString(), receiverId);
    // AwesomeNotifications().createNotification(
    //   content: NotificationContent(
    //       id: 1,
    //       channelKey: "basic_channel",
    //       title: "Seveen",
    //       body: "message"));
    timer = Timer.periodic(const Duration(seconds: 2), (t) async {
      // AwesomeNotifications().setListeners(onActionReceivedMethod: )
      await getUserMessages(
          receiverId, auth.account['userID'].toString());
    });

    super.onInit();
  }

  Future getUserMessages(String senderId, String receiverId) async {
    ApiService api = ApiService(
        url: 'messages/', accessToken: auth.account['accessToken']);
    newMsgs = await api.getUserMessage(senderId, receiverId);
    if (msgs.length == newMsgs.length) {
      return;
    }
    msgs.addAll(
        newMsgs.where((a) => msgs.every((b) => a.id != b!.id)));

    if (msgs.isNotEmpty) {
      messages.clear();
      for (int i = 0; i < msgs.length; i++) {
        // if(msgs[i].id==)
        var time = DateTime.parse(msgs[i]!.created!).toLocal();
        ChatMessage message = ChatMessage(
            user: ChatUser(
                id: msgs[i]!.senderId!.toString(),
                firstName: msgs[i]!.sender),
            text: msgs[i]!.message!,
            createdAt: time);

        messages.add(message);
      }
      messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }
  }

  Future sendMessage(String msg, String receiverId) async {
    ApiService api = ApiService(
        url: 'messages',
        accessToken: auth.account['accessToken'],
        body: mapToQuery(<String, dynamic>{
          "message": msg,
          "sender_id": currentUser.id,
          "receiver_id": receiverId
        }));
    await api.sendMessage();
  }

  mapToQuery(Map<String, dynamic> map) {
    map.keys
        .where((k) => (map[k] == null || map[k] == ''))
        .toList() // -- keys for null elements
        .forEach(map.remove);

    return map;
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
