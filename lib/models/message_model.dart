import 'dart:convert';
import 'dart:ffi';

import 'package:dash_chat_2/dash_chat_2.dart';

List<MessageModel> MessageModelFromJson(String str) =>
    List<MessageModel>.from(
        json.decode(str).map((x) => MessageModel.fromJson(x)));

class MessageModel {
  String? id;
  String? user;
  String? uid;
  String? message;

  int? created;

  MessageModel(
      {this.id,
      this.user,
      required this.uid,
      this.message,
      this.created});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    user = json['username'];
    message = json['message'];
    created = json['created'];
  }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     data['message'] = message;
//     data['created'] = created;
//     return data;
//   }
// }

// class User {
//   String? id;
//   String? username;

//   User({this.id, this.username});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     username = json['username'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['username'] = this.username;
//     return data;
//   }
}
