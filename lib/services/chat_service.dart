import 'package:flutter/cupertino.dart';
import 'package:sendbird_sdk/core/models/user.dart';
import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';

class ChatSerivce {
  Future<User> connect(String userId) async {
    try {
      final sendbird =
          SendbirdSdk(appId: "D47B22CF-320E-4711-A02F-E2278CD5B43D");
      final user = await sendbird.connect(userId);
      return user;
    } catch (e) {
      debugPrint('connect: ERROR: $e');
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
