import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/features/account/account_vm.dart';
import 'package:van_android_getx/features/home/vm/drawer_vm.dart';

import '../../account/login_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountVM accountVM = Get.find<AccountVM>();
    final DrawerVm drawerVm = Get.put(DrawerVm());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF5A78EA),
            ),
            child: Obx(() {
              return GestureDetector(
                child: Text(
                  accountVM.accountInfo.value?.nickname ?? "去登录",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  Get.to(const LoginPage());
                },
              );
            }),
          ),
          Obx(() => ListTile(
                leading: const Icon(Icons.score),
                title: Text(
                    '我的积分：【${accountVM.accountInfo.value?.coinCount ?? "点击刷新"}】'),
                onTap: () {
                  drawerVm.fetchCoin();
                },
              )),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('系统设置'),
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text('退出登录'),
          ),
        ],
      ),
    );
  }
}
