import 'dart:convert';

// ignore: non_constant_identifier_names
List<TagModel> TagModelFromJson(String str) => List<TagModel>.from(
    json.decode(str).map((x) => TagModel.fromJson(x)));

class TagModel {
  int? tagId;
  String? tagDescr;

  TagModel({this.tagId, this.tagDescr});

  TagModel.fromJson(Map<String, dynamic> json) {
    tagId = json['tag_id'];
    tagDescr = json['tag_descr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tag_id'] = tagId;
    data['tag_descr'] = tagDescr;
    return data;
  }
}
