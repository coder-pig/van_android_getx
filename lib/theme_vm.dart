import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/const/themes.dart';

class ThemeVM extends GetxController {
  var currentTheme = leiMuBlueTheme.obs;

  void changeTheme(ThemeData theme) {
    currentTheme.value = theme;
  }
}