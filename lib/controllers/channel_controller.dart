import 'package:alsham_socialmedia/views/pages/chat_channels_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sendbird_sdk/constant/enums.dart';
import 'package:sendbird_sdk/core/channel/group/group_channel.dart';
import 'package:sendbird_sdk/core/models/user.dart';
import 'package:sendbird_sdk/params/group_channel_params.dart';
import 'package:sendbird_sdk/query/channel_list/group_channel_list_query.dart';
import 'package:sendbird_sdk/query/user_list/user_list_query.dart';
import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';

class ChannelController extends GetxController {
  // ChatSerivce chatSerivce = ChatSerivce();

  final Set selectedUsers = {};
  final List availableUsers = [];
  @override
  void onInit() async {
    // await chatSerivce.connect('salah');

    super.onInit();
  }

  Future<List<GroupChannel>> getGroupChannels() async {
    try {
      final query = GroupChannelListQuery()
        ..includeEmptyChannel = true
        ..order = GroupChannelListOrder.latestLastMessage
        ..limit = 15;
      return await query.loadNext();
    } catch (e) {
      print('getGroupChannels: ERROR: $e');
      return [];
    }
  }

  Future<List<User>> getUsers() async {
    try {
      final query = ApplicationUserListQuery();
      List<User> users = await query.loadNext();
      return users;
    } catch (e) {
      print('getUsers: ERROR: $e');
      return [];
    }
  }

  Future<GroupChannel> createChannel(List<String> userIds) async {
    try {
      final params = GroupChannelParams()..userIds = userIds;
      final channel = await GroupChannel.createChannel(params);
      return channel;
    } catch (e) {
      print('createChannel: ERROR: $e');
      throw e;
    }
  }

  @override
  void onClose() {
    SendbirdSdk().removeChannelEventHandler("channel_list_view");
    super.onClose();
  }
}
