import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../account/login/login_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF5A78EA),
              ),
              child: GestureDetector(
                child: const Text(
                  "去登录",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  Get.to(const LoginPage());
                },
              ),
            ),
            const ListTile(
              leading: Icon(Icons.score),
              title: Text('我的积分)}'),
            ),
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
