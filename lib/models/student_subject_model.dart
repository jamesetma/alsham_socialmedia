import 'dart:convert';

List<StudentSubjectModel> studentSubjectModelFromJson(String str) =>
    List<StudentSubjectModel>.from(
        json.decode(str).map((x) => StudentSubjectModel.fromJson(x)));

class StudentSubjectModel {
  int? studentId;
  int? tagId;

  StudentSubjectModel({this.studentId, this.tagId});

  StudentSubjectModel.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    tagId = json['tag_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['tag_id'] = this.tagId;
    return data;
  }
}
