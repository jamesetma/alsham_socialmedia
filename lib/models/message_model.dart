import 'dart:convert';

List<MessageModel> MessageModelFromJson(String str) =>
    List<MessageModel>.from(
        json.decode(str).map((x) => MessageModel.fromJson(x)));

class MessageModel {
  int? id;
  String? sender;
  int? senderId;
  int? receiverId;
  String? message;
  String? created;

  MessageModel(
      {this.id,
      this.sender,
      this.senderId,
      this.receiverId,
      this.message,
      this.created});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    sender = json['sender'];
    message = json['message'];
    created = json['created'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   if (user != null) {
  //     data['user'] = user!.toJson();
  //   }
  //   data['message'] = message;
  //   data['created'] = created;
  //   return data;
  // }
}

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

