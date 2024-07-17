import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/core/services/api/van_api.dart';
import 'package:van_android_getx/core/utils/toast_utils.dart';
import 'package:van_android_getx/data/model/navi_info.dart';

class NaviVM extends GetxController {
  var naviInfoItems = List<NaviInfo>.empty(growable: true).obs;

  // 拉取导航数据
  Future<void> fetchNavi() async {
    var result = await VanApi.navi();
    if (result.error == null) {
      naviInfoItems.addAll(result.data ?? []);
    } else {
      showToast(msg: result.errorMsg);
    }
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchNavi();
    });
  }
}
