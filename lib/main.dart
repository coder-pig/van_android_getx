import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:van_android_getx/features/main/main_bindings.dart';
import 'package:van_android_getx/theme_vm.dart';
import 'features/main/main_page.dart';

void main() async {
  await GetStorage.init(); // 初始化GetStorage
  final themeVM = Get.put(ThemeVM());
  runApp(Obx(
      () => GetMaterialApp(theme: themeVM.currentTheme.value, initialBinding: MainBindings(), home: const MainPage())));
}
