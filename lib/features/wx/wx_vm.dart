import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/core/services/api/van_api.dart';
import 'package:van_android_getx/core/utils/toast_utils.dart';
import 'package:van_android_getx/data/model/wx_account_info.dart';

class WxVM extends GetxController with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  var wxAccounts = List<WxAccountInfo>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchWXAccounts();
    });
  }

  // 拉取公众号列表
  Future<void> fetchWXAccounts({bool? isRefresh = false}) async {
    var result = await VanApi.wxAccounts();
    if (result.error == null) {
      wxAccounts.addAll(result.data ?? []);
      tabController = TabController(length: wxAccounts.length, vsync: this);
      tabController?.addListener(() {
        if (!tabController!.indexIsChanging) {}
      });
    } else {
      showToast(msg: result.errorMsg);
    }
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }
}
