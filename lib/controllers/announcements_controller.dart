import 'dart:async';

import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/controllers/tag_controller.dart';
import 'package:alsham_socialmedia/models/announcements_model.dart';
import 'package:alsham_socialmedia/models/tag_model.dart';
import 'package:alsham_socialmedia/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AnnouncementsController extends GetxController {
  AuthController auth = Get.find<AuthController>();
  TagController tagController = Get.find<TagController>();
  StudentController studentController = Get.find<StudentController>();

  late TextEditingController caption;
  Timer? timer;
  bool isFiltered = true;

  List<TagModel> tags = [];
  RxList<String> tagNameList = RxList<String>();
  late RxString tagValue = 'tag'.obs;
  TagModel selectedTag = TagModel();

  RxList<AnnouncementsModel> announcements =
      RxList<AnnouncementsModel>();
  RxList<AnnouncementsModel> filteredAnnouncements =
      RxList<AnnouncementsModel>();
  List<AnnouncementsModel> newAnns = [];
  @override
  void onInit() async {
    studentController = Get.find<StudentController>();
    caption = TextEditingController();
    tagValue.value = 'Tags';
    tags.assignAll(tagController.tags);
    tagNameList.assignAll(tagController.tagNameList);
    await getAnnoucements();

    super.onInit();
  }

  @override
  void onReady() {
    selectedTag = tags
        .firstWhere((element) => element.tagDescr == tagValue.value);
    timer = Timer.periodic(const Duration(seconds: 5), (t) async {
      await getAnnoucements();
    });
    super.onReady();
  }

  Future getAnnoucements() async {
    filteredAnnouncements.clear();
    ApiService api = ApiService(
        url: "announcments/",
        accessToken: auth.account['accessToken']);
    newAnns = await api.fetchAnnouncements();

    announcements.assignAll(newAnns);

    for (int i = 0;
        i < studentController.studentSubjects.length;
        i++) {
      filteredAnnouncements.addAllIf(
          announcements.every(
              (element) => !filteredAnnouncements.contains(element)),
          announcements
              .where((announcement) =>
                  int.parse(announcement.tagId!) ==
                  studentController.studentSubjects[i].tagId)
              .toList());
    }

    filteredAnnouncements.sort(
      (a, b) => DateTime.parse(a.created!).compareTo(
        DateTime.parse(b.created!),
      ),
    );
  }

  Future postAnnouncement() async {
    selectedTag = tagController.tags.firstWhere(
        (element) => element.tagDescr == studentController.tagName);
    print(caption.text);
    print(selectedTag.tagId);
    ApiService api = ApiService(
      url: 'announcments/',
      accessToken: auth.account['accessToken'],
      body: <String, dynamic>{
        "text": caption.text,
        "media_link": '',
        "sender_id": auth.account["userID"].toString(),
        "tag_id": selectedTag.tagId?.toString() ?? "1",
      },
    );
    await api.create();
  }

  mapToQuery(Map<String, dynamic> map) {
    map.keys
        .where((k) => (map[k] == null || map[k] == ''))
        .toList() // -- keys for null elements
        .forEach(map.remove);

    return map;
  }
}
