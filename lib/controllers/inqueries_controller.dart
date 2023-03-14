import 'dart:async';

import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/controllers/student_controller.dart';
import 'package:alsham_socialmedia/controllers/tag_controller.dart';
import 'package:alsham_socialmedia/models/inqueries_model.dart';
import 'package:alsham_socialmedia/models/tag_model.dart';
import 'package:alsham_socialmedia/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InqueriesController extends GetxController {
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

  RxList<InqueriesModel> inqueries = RxList<InqueriesModel>();
  RxList<InqueriesModel> filteredInqueries = RxList<InqueriesModel>();
  List<InqueriesModel> newInqs = [];
  @override
  void onInit() async {
    studentController = Get.find<StudentController>();
    caption = TextEditingController();
    tagValue.value = 'Tags';
    tags.assignAll(tagController.tags);
    tagNameList.assignAll(tagController.tagNameList);
    await getInqueries();
    selectedTag = tags
        .firstWhere((element) => element.tagDescr == tagValue.value);
    timer = Timer.periodic(const Duration(seconds: 5), (t) async {
      await getInqueries();
    });

    super.onInit();
  }

  Future getInqueries() async {
    filteredInqueries.clear();

    ApiService api = ApiService(
        url: "inqueries/", accessToken: auth.account['accessToken']);
    newInqs = await api.fetchInqueries();

    inqueries.assignAll(newInqs);

    for (int i = 0;
        i < studentController.studentSubjects.length;
        i++) {
      filteredInqueries.addAllIf(
          inqueries.every(
              (element) => !filteredInqueries.contains(element)),
          inqueries
              .where((inqueries) =>
                  int.parse(inqueries.tagId!) ==
                  studentController.studentSubjects[i].tagId)
              .toList());
    }

    filteredInqueries.sort(
      (a, b) => DateTime.parse(a.created!).compareTo(
        DateTime.parse(b.created!),
      ),
    );
  }

  Future postinquery() async {
    selectedTag = tagController.tags.firstWhere(
        (element) => element.tagDescr == studentController.tagName);
    print(caption.text);
    ApiService api = ApiService(
      url: 'inqueries/',
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
