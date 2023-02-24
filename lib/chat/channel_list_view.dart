import 'package:flutter/material.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class ChannelListView extends StatefulWidget {
  @override
  _ChannelListViewState createState() => _ChannelListViewState();
}

class _ChannelListViewState extends State<ChannelListView>
    with ChannelEventHandler {
  Future<User> connect(String appId, String userId) async {
    try {
      final sendbird = SendbirdSdk(appId: appId);
      final user = await sendbird.connect(userId);
      return user;
    } catch (e) {
      print('connect: ERROR: $e');
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
    connect('D47B22CF-320E-4711-A02F-E2278CD5B43D', '163582');
    SendbirdSdk().addChannelEventHandler('channel_list_view', this);
  }

  @override
  void dispose() {
    SendbirdSdk().removeChannelEventHandler("channel_list_view");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
