import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/features/account/account_vm.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountVM vm = Get.put(AccountVM());
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册页', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: vm.registerUserNameController,
              decoration: const InputDecoration(
                labelText: '用户名',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: vm.registerPasswordController,
              decoration: const InputDecoration(
                labelText: '密码',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: vm.registerReUserNameController,
              decoration: const InputDecoration(
                labelText: '确认密码',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: vm.register,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: const Text('注册'),
            ),
          ],
        ),
      ),
    );
  }

}