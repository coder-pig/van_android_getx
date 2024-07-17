import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainVM extends GetxController {
  var tabIndex = 0.obs;
  var mainPageController = PageController(initialPage: 0);

  @override
  void onClose() {
    mainPageController.dispose();
    super.onClose();
  }
}
