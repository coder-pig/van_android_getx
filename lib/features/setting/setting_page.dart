import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/const/themes.dart';
import 'package:van_android_getx/theme_vm.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Get.find<ThemeVM>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('系统设置'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.color_lens,
                color: Theme.of(context).primaryColor,
              ),
              const Text("主题切换")
            ],
          ),
          Row(
            children: [
              GestureDetector(
                child: Container(width: 48, height: 48, color: leiMuBlue),
                onTap: () {
                  vm.changeTheme(leiMuBlueTheme);
                },
              ),
              const SizedBox(width: 10),
              GestureDetector(
                child: Container(width: 48, height: 48, color: laMuPink),
                onTap: () {
                  vm.changeTheme(laMuPinkTheme);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
