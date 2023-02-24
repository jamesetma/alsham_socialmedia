import 'package:alsham_socialmedia/chat/channel_list_view.dart';
import 'package:alsham_socialmedia/customfullscreendialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sendbird_sdk/core/models/user.dart';
import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';

class LoginChat extends StatelessWidget {
  LoginChat({super.key});
  final sendbird =
      SendbirdSdk(appId: "D47B22CF-320E-4711-A02F-E2278CD5B43D");
  Future<User?> connect() async {
    try {
      final user = await sendbird.connect("163582");
      return user;
    } catch (e) {
      print('connect: ERROR: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            // CustomFullScreenDialog.showDialog();
            connect().then((value) => value == null
                ? print("error connecting to chat server")
                : {Get.to(() => ChannelListView())});
          },
          child: Text('LOGIN'),
        ),
      ),
    );
  }
}
