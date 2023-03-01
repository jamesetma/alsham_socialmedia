import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/models/message_model.dart';
import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatController extends GetxController {
  late io.Socket socket;
  RxList<ChatMessage> messagesList = RxList<ChatMessage>();

  AuthController auth = Get.find<AuthController>();

  // ChatUser user2 = ChatUser(
  //   id: '4',
  //   firstName: 'mom',
  // );
  late StudentModel student;
  // late var myChat =
  //     ChatMessage(user: user, createdAt: convertTimeStamp(2321));

  ChatUser user = ChatUser(id: '1');
  @override
  void onInit() async {
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
      socket = io.io('http://192.168.1.107:3500',
          io.OptionBuilder().setTransports(['websocket']).build());
      socket.connect();

      socket.onConnect((_) {
        print('connection established');
      });

      socket.on("messages", (messages) {
        print("****************" + messages.toString());
        msgs = MessageModelFromJson(messages.toString());
        for (int i = 0; i < msgs.length; i++) {
          messagesList.add(
            ChatMessage(
              user:
                  ChatUser(id: msgs[i].uid!, firstName: msgs[i].user),
              text: msgs[i].message ?? 'hey',
              createdAt: convertTimeStamp(
                msgs[i].created!,
              ),
            ),
          );
        }
      });

      socket.on("message", (message) {
        print("###########" + message.toString());
      });
      socket.onConnect((_) {
        // openUsernameDialog();
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
