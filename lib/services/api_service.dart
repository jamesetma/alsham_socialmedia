import 'dart:convert';

import 'package:alsham_socialmedia/constants/urls.dart';
import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String url;
  final dynamic body;
  final String? accessToken;
  static String hostname = URLS.apiURL2;
  static var client = http.Client();

  ApiService({required this.url, this.body, this.accessToken});

  Future<List<StudentModel>> fetchStudents() async {
    var response = await client.get(Uri.parse(hostname + url),
        headers: ({"authorization": accessToken!}));
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return studentModelFromJson(jsonString);
    } else {
      debugPrint('Server error ${response.statusCode}');
      throw -1;
    }
  }

  Future<StudentModel> getCurrentStudent(String id) async {
    var res = await client.get(Uri.parse('$hostname$url$id'),
        headers: {"authorization": accessToken!}).then((response) {
      if (response.statusCode == 200) {
        // print(response.body);
        var jsonString = response.body;
        var student = studentModelFromJson(jsonString);
        return student[0];
      } else {
        print(response.statusCode);
        print(response.body);
        throw -1;
      }
    });
    return res;
  }

  Future<http.Response> createStudent() async {
    var response = await client.post(Uri.parse(hostname + url),
        body: body, headers: ({"authorization": accessToken!}));
    if (response.statusCode == 201) {
      debugPrint('Successfully uploaded to database');
    } else {
      debugPrint(response.statusCode.toString());
    }
    return response;
  }

  Future<http.Response> editStudent() async {
    var response = await client.put(Uri.parse(hostname + url),
        body: body, headers: {"authorization": accessToken!});
    if (response.statusCode == 201) {
      debugPrint('Successfully updated in database');
    } else {
      debugPrint(response.statusCode.toString());
    }
    return response;
  }

  Future<http.Response> deleteStudent() async {
    var response = await client.delete(Uri.parse(hostname + url),
        body: body, headers: {"authorization": accessToken!});
    if (response.statusCode == 201) {
      debugPrint('Successfully deleted student in database');
    } else
      debugPrint(response.statusCode.toString());
    return response;
  }

  Future<http.Response> loginStudent() async {
    var response = await client
        .post(Uri.parse(hostname + url), body: body)
        .timeout(Duration(minutes: 1));
    if (response.statusCode == 200) {
      debugPrint('Successfully Logged in');
    } else
      debugPrint(response.statusCode.toString() + "error logging in");
    return response;
  }

  Future<http.Response> signupStudent() async {
    var response =
        await client.post(Uri.parse(hostname + url), body: body);
    if (response.statusCode == 201) {
      debugPrint('Successfully Logged in');
    } else
      debugPrint(response.statusCode.toString());
    return response;
  }
}
