import 'dart:convert';

List<AccountModel> AccountModelFromJson(String str) =>
    List<AccountModel>.from(
        json.decode(str).map((x) => AccountModel.fromJson(x)));

class AccountModel {
  String? accessToken;
  int? userID;

  AccountModel({this.accessToken, this.userID});

  AccountModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['userID'] = userID;
    return data;
  }
}
