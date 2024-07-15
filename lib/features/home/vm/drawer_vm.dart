import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/core/services/api/van_api.dart';
import 'package:van_android_getx/data/model/integral.dart';

class DrawerVm extends GetxController {
  var integral = Rx<Integral?>(null);

  // 查询积分
  Future<void> fetchCoin() async {
    final result = await VanApi.requestCoin();
    if (result.error == null) {
      integral.value = result.data;
      // 成功
    } else {
      // 失败
    }
  }


  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchCoin();
    });
  }

}