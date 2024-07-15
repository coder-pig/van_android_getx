import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexPageController extends GetxController {
  var tabIndex = 0.obs;
  var indexPageController = PageController(initialPage: 0);
  @override
  void onInit() {
    super.onInit();

  }
}
