import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/core/services/api/van_api.dart';
import 'package:van_android_getx/core/utils/toast_utils.dart';
import 'package:van_android_getx/data/model/home_article_info.dart';
import 'package:van_android_getx/data/model/home_banner_info.dart';

class HomeVM extends GetxController {
  // Banner
  var bannerItems = List<HomeBannerInfo>.empty(growable: true).obs;

  // 文章
  var homeArticleInfoItems = List<ArticleInfo>.empty(growable: true).obs;
  var currentPage = 0; // 当前页数

  // 拉取Banner
  Future fetchHomeBanner() async {
    var result = await VanApi.homeBanner();
    if (result.error == null) {
      bannerItems.value = result.data ?? [];
    } else {
      showToast(msg: result.errorMsg);
    }
  }

  // 拉取文章
  Future<void> fetchArticleList({bool? isRefresh = false}) async {
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
    // 页面初始化的时候拉下数据
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchHomeBanner();
      fetchArticleList(isRefresh: true);
    });
  }
}
