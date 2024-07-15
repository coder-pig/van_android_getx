import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../register/register_page.dart';
import 'login_vm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginVM loginVM = Get.put(LoginVM());
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录页', style: TextStyle(color: Colors.white)),
        backgroundColor: Get.theme.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: loginVM.userNameController,
              decoration: const InputDecoration(
                labelText: '用户名',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: loginVM.passwordController,
              decoration: const InputDecoration(
                labelText: '密码',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: loginVM.login,
              color: Get.theme.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: const Text('登录', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 12.0),
            GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                  child: const Text("去注册", style: TextStyle(color: Colors.grey)),
                ),
                onTap: () {
                  // 跳转注册页，如果注册页返回true页关闭登录页
                  Get.to(const RegisterPage())?.then((value) {
                    if (value == true) Get.back();
                  });
                })
          ],
        ),
      ),
    );
  }
}
