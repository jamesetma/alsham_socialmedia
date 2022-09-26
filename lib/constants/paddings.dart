import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Paddings {
  static final _topPadding = Get.height / 100;
  static final _sidePadding = Get.width / 20;

  static final topPadding = EdgeInsets.symmetric(vertical: _topPadding);
  static final sidePadding = EdgeInsets.symmetric(horizontal: _sidePadding);
  static final bothPadding =
      EdgeInsets.symmetric(horizontal: _sidePadding, vertical: _topPadding);
}
