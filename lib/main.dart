import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:van_android_getx/features/main/main_bindings.dart';
import 'features/main/main_page.dart';
import 'package:van_android_getx/const/themes.dart';

void main() async {
  await GetStorage.init(); // 初始化GetStorage
  runApp(GetMaterialApp(theme: leiMuBlueTheme, initialBinding: MainBindings(), home: const MainPage()));
}
