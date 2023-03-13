import 'package:alsham_socialmedia/controllers/auth_controller.dart';
import 'package:alsham_socialmedia/models/tag_model.dart';
import 'package:alsham_socialmedia/services/api_service.dart';
import 'package:get/get.dart';

class TagController extends GetxController {
  AuthController auth = Get.find<AuthController>();
  List<TagModel> tags = [];
  List<String> tagNameList = [];
  List<int> tagIdList = [];

  @override
  void onInit() async {
    await getTags().whenComplete(() {
      for (int i = 0; i < tags.length; i++) {
        tagNameList.add(tags[i].tagDescr!);
        print(tagNameList[i]);
      }
    });
    await getTags().whenComplete(() {
      for (int i = 0; i < tags.length; i++) {
        tagIdList.add(tags[i].tagId!);
        print(tagIdList[i]);
      }
    });

    super.onInit();
  }

  Future getTags() async {
    ApiService api = ApiService(
      url: "tags/",
      accessToken: auth.account['accessToken'],
    );
    tags.assignAll(await api.fetchTags());
  }

  // Future<List<StudentSubjectModel>> getStudentSubjects() async {
  //   ApiService api = ApiService(
  //     url: 'student_subject',
  //     accessToken: auth.account["accessToken"],
  //   );
  //   return await api.fetchStudentSubjects();
  // }
}
