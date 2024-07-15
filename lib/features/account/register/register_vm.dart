import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:van_android_getx/core/services/api/api_client.dart';
import 'package:van_android_getx/core/services/api/van_api.dart';
import 'package:van_android_getx/core/utils/toast_utils.dart';
import 'package:van_android_getx/data/model/account_register.dart';

class RegisterVM extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  var apiClient = Get.find<ApiClient>();

  // 注册
  Future register() async {
    final username = usernameController.text;
    final password = passwordController.text;
    final rePassword = rePasswordController.text;
    if (username.isNotEmpty && password.isNotEmpty && rePassword.isNotEmpty) {
      if (password == rePassword) {
        var result = await VanApi.register(AccountRegisterReq(username, password, rePassword));
        if (result.error == null) {
          var cookies = result.headers?['set-cookie'];
          if (null != cookies) {
            VanApi.updateCookies(cookies);
            Get.find<GetStorage>().write("Cookie", cookies);
          }
          if (null != result.data?.nickname) showToast(msg: "【${result.data!.nickname}】注册成功");
          // 注册成功登录页面也关闭
          Get.back(result: true);
        } else {
          showToast(msg: result.errorMsg);
        }
      } else {
        showToast(msg: "两次输入的密码不一致");
      }
    } else {
      showToast(msg: "用户名或密码不能为空");
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }
}
