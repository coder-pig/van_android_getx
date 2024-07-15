import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:van_android_getx/core/services/api/api_client.dart';
import 'package:van_android_getx/core/services/api/van_api.dart';
import 'package:van_android_getx/core/utils/toast_utils.dart';
import 'package:van_android_getx/data/model/account_login.dart';

class LoginVM extends GetxController {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var apiClient = Get.find<ApiClient>();

  // 登录
  Future login() async {
    final username = userNameController.text;
    final password = passwordController.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      var result = await VanApi.login(AccountLoginReq(username, password));
      if (result.error == null) {
        var cookies = result.headers?['set-cookie'];
        if (null != cookies) {
          VanApi.updateCookies(cookies);
          Get.find<GetStorage>().write("Cookie", cookies);
        }
        if (null != result.data?.nickname) showToast(msg: "【${result.data!.nickname}】登录成功");
        Get.back();
      } else {
        showToast(msg: result.errorMsg);
      }
    } else {
      showToast(msg: "用户名或密码不能为空");
    }
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
