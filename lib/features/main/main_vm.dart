import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/core/services/api/van_api.dart';
import 'package:van_android_getx/core/utils/toast_utils.dart';
import 'package:van_android_getx/data/model/home_article_info.dart';

class MainVM extends GetxController {
  var tabIndex = 0.obs;
  var mainPageController = PageController(initialPage: 0);

  @override
  void onClose() {
    mainPageController.dispose();
    super.onClose();
  }
}
