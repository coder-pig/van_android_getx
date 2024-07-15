import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/core/services/api/van_api.dart';
import 'package:van_android_getx/core/utils/toast_utils.dart';
import 'package:van_android_getx/data/model/home_article_info.dart';

class HomePageVM extends GetxController {
  var tabIndex = 0.obs;
  var indexPageController = PageController(initialPage: 0);

  // 列表
  var homeArticleInfoItems = List<ArticleInfo>.empty(growable: true).obs;
  var currentPage = 0; // 当前页数

  Future<void> fetchHomeArticleInfoItems({bool? isRefresh = false}) async {
    if (isRefresh == true) {
      currentPage = 0;
      homeArticleInfoItems.clear();
    } else {
      currentPage++;
    }
    var result = await VanApi.homeArticleList(currentPage);
    if (result.error == null) {
      homeArticleInfoItems.addAll((result.data?.datas ?? []));
    } else {
      showToast(msg: result.errorMsg);
    }
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchHomeArticleInfoItems(isRefresh: true);
    });
  }

  @override
  void onClose() {
    indexPageController.dispose();
    super.onClose();
  }
}
