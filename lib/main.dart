import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:van_android_getx/home_bindings.dart';
import 'package:van_android_getx/features/home/widgets/index_bottom_bar_widget.dart';
import 'features/home/widgets/index_container_widget.dart';
import 'index_controller.dart';
import 'package:van_android_getx/const/themes.dart';

import 'features/home/pages/drawer_page.dart';

void main() async {
  await GetStorage.init(); // 初始化GetStorage
  runApp(GetMaterialApp(
      theme: leiMuBlueTheme,
      initialBinding: HomeBindings(),
      home: const MainPage()));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IndexPageController());
    return Scaffold(
        appBar: AppBar(title: const Text("Van ♂ Android")),
        body: const Column(
          children: [
            IndexContainerWidget(),
            IndexBottomBarWidget(),
          ],
        ),
        drawer: const DrawerPage());
  }
}
