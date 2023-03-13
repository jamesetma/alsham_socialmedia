import 'dart:convert';

import 'package:alsham_socialmedia/constants/urls.dart';
import 'package:alsham_socialmedia/models/inqueries_model.dart';
import 'package:alsham_socialmedia/models/announcements_model.dart';
import 'package:alsham_socialmedia/models/message_model.dart';
import 'package:alsham_socialmedia/models/student_model.dart';
import 'package:alsham_socialmedia/models/student_subject_model.dart';
import 'package:alsham_socialmedia/models/tag_model.dart';
import 'package:alsham_socialmedia/views/pages/create_announcement_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String url;
  final dynamic body;
  final String? accessToken;
  static String hostname = URLS.apiURL1;
  static var client = http.Client();

  ApiService({required this.url, this.body, this.accessToken});
// student CRUD ---------------------------------------------------
  Future<List> fetch() async {
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

  Future getCurrent(String id) async {
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

  Future<http.Response> create() async {
    var response = await client.post(Uri.parse(hostname + url),
        body: body, headers: ({"authorization": accessToken!}));
    if (response.statusCode == 201) {
      debugPrint('Successfully uploaded to database');
    } else {
      debugPrint(response.body);
    }
    return response;
  }

  Future<http.Response> edit() async {
    var response = await client.put(Uri.parse(hostname + url),
        body: body, headers: {"authorization": accessToken!});
    if (response.statusCode == 201) {
      debugPrint('Successfully updated in database');
    } else {
      debugPrint(response.statusCode.toString());
    }
    return response;
  }

  Future<http.Response> delete() async {
    var response = await client.delete(Uri.parse(hostname + url),
        body: body, headers: {"authorization": accessToken!});
    if (response.statusCode == 201) {
      debugPrint('Successfully deleted student in database');
    } else
      debugPrint(response.statusCode.toString());
    return response;
  }
// chat CRUD ---------------------------------------------------------

  Future<List<MessageModel>> getUserMessage(
      String senderId, String receiverId) async {
    var res = await client.get(
        Uri.parse('$hostname$url$senderId/$receiverId'),
        headers: {"authorization": accessToken!}).then((response) {
      if (response.statusCode == 200) {
        // print(response.body);
        var jsonString = response.body;
        var messages = MessageModelFromJson(jsonString);
        return messages;
      } else {
        print(response.statusCode);
        print(response.body);
        throw -1;
      }
    });
    return res;
  }

  Future<http.Response> sendMessage() async {
    var response = await client.post(Uri.parse(hostname + url),
        body: body, headers: ({"authorization": accessToken!}));
    if (response.statusCode == 201) {
      debugPrint('Successfully sent message');
    } else {
      debugPrint(response.body);
    }
    return response;
  }

// Announcements crud ------------------------------------------------
  Future<List<AnnouncementsModel>> fetchAnnouncements() async {
    var response = await client.get(Uri.parse(hostname + url),
        headers: ({"authorization": accessToken!}));
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return announcementsModelFromJson(jsonString);
    } else {
      debugPrint('Server error ${response.statusCode}');
      throw -1;
    }
  }

  Future<AnnouncementsModel> getAnnById(String id) async {
    var response = await client.get(Uri.parse('$hostname$url$id'),
        headers: {"authorization": accessToken!});
    if (response.statusCode == 200) {
      // print(response.body);
      var jsonString = response.body;
      var announcements = announcementsModelFromJson(jsonString);
      return announcements[0];
    } else {
      print(response.statusCode);
      print(response.body);
      throw -1;
    }
  }

// Tag CRUD ----------------------------------------------------------

  Future<List<TagModel>> fetchTags() async {
    var response = await client.get(Uri.parse(hostname + url),
        headers: ({"authorization": accessToken!}));
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return TagModelFromJson(jsonString);
    } else {
      debugPrint('## Server error: ${response.statusCode}');
      throw -1;
    }
  }
// student_subject ---------------------------------------------------

  Future<List<StudentSubjectModel>> fetchStudentSubjects(
      String studentId) async {
    var response = await client.get(
        Uri.parse("$hostname$url$studentId"),
        headers: ({"authorization": accessToken!}));
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return studentSubjectModelFromJson(jsonString);
    } else {
      debugPrint('Server error ${response.statusCode}');
      throw -1;
    }
  }

// inqueries

  Future<List<InqueriesModel>> fetchInqueries() async {
    var response = await client.get(Uri.parse(hostname + url),
        headers: ({"authorization": accessToken!}));
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return inqueriesModelFromJson(jsonString);
    } else {
      debugPrint('Server error ${response.statusCode}');
      throw -1;
    }
  }

// Login And Sign Up -------------------------------------------------
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
