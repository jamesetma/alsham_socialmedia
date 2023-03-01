import 'dart:convert';

List<StudentModel> studentModelFromJson(String str) =>
    List<StudentModel>.from(
        json.decode(str).map((x) => StudentModel.fromJson(x)));

String studentModelToJson(Map<String, StudentModel> data) =>
    json.encode(Map.from(data)
        .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class StudentModel {
  int? userId;
  String? studentName;
  String? universityNumber;
  String? academicYear;
  String? phone;
  String? biography;

  StudentModel(
      {this.userId,
      this.studentName,
      this.universityNumber,
      this.academicYear,
      this.phone,
      this.biography});

  StudentModel.fromJson(Map<String, dynamic> json) {
    userId = json['userID'];
    studentName = json['student_name'];
    universityNumber = json['university_number'];
    academicYear = json['academic_year'];
    phone = json['phone'];
    biography = json['biography'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userId;
    data['student_name'] = studentName;
    data['university_number'] = universityNumber;
    data['academic_year'] = academicYear;
    data['phone'] = phone;
    data['biography'] = biography;
    return data;
  }
}
