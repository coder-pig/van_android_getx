import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/core/services/api/van_api.dart';
import 'package:van_android_getx/core/utils/toast_utils.dart';
import 'package:van_android_getx/data/model/home_article_info.dart';

class WxArticleListVM extends GetxController {
  final int wxId; // 微信公众号ID
  WxArticleListVM(this.wxId);

  // 文章列表
  var articleInfoItems = List<ArticleInfo>.empty(growable: true).obs;
  var currentPage = 0; // 当前页数

  // 拉取文章
  Future<void> fetchArticleList({bool? isRefresh = false}) async {
    if (isRefresh == true) {
      currentPage = 0;
      articleInfoItems.clear();
    } else {
      currentPage++;
    }
    var result = await VanApi.wxArticleList(wxId, currentPage);
    if (result.error == null) {
      articleInfoItems.addAll((result.data?.datas ?? []));
    } else {
      showToast(msg: result.errorMsg);
    }
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchArticleList();
    });
  }
}
