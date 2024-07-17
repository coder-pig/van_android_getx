import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/features/account/account_vm.dart';
import 'package:van_android_getx/features/account/login_page.dart';
import 'package:van_android_getx/features/home/vm/drawer_vm.dart';
import 'package:van_android_getx/features/setting/setting_page.dart';

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
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                Image.asset("assets/images/ic_nav_icon.png", width: 64, height: 64),
                const SizedBox(height: 10),
                // 用户名
                Obx(() {
                  return GestureDetector(
                    child: Text(
                      accountVM.accountInfo.value?.nickname ?? "去登录",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    onTap: () {
                      if (accountVM.accountInfo.value == null) {
                        Get.to(const LoginPage());
                      }
                    },
                  );
                })
              ],
            ),
          ),
          // 积分
          Obx(() => ListTile(
                leading: const Icon(Icons.score),
                title: Text('我的积分：【${accountVM.accountInfo.value?.coinCount ?? "点击刷新"}】'),
                onTap: drawerVm.fetchCoin,
              )),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('系统设置'),
            onTap: () {
              Get.to(const SettingPage());
            },
          ),
          Obx(() => Visibility(
              visible: accountVM.accountInfo.value != null,
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('退出登录'),
                onTap: accountVM.logout,
              ))),
        ],
      ),
    );
  }
}
