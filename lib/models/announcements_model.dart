import 'dart:convert';

List<AnnouncementsModel> announcementsModelFromJson(String str) =>
    List<AnnouncementsModel>.from(
        json.decode(str).map((x) => AnnouncementsModel.fromJson(x)));

String announcmentsModelToJson(
        Map<String, AnnouncementsModel> data) =>
    json.encode(Map.from(data)
        .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class AnnouncementsModel {
  String? text;
  String? mediaLink;
  String? username;
  String? tagDescr;
  String? created;
  String? tagId;

  AnnouncementsModel(
      {this.text,
      this.mediaLink,
      this.username,
      this.tagDescr,
      this.created});

  AnnouncementsModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    mediaLink = json['media_link'];
    username = json['username'];
    tagDescr = json['tag_descr'];
    created = json['created'];
    tagId = json['tag_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['media_link'] = mediaLink;
    data['username'] = username;
    data['tag_descr'] = tagDescr;
    data['created'] = created;
    data['tag_id'] = tagId;
    return data;
  }
}
