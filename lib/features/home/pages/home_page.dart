import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/core/utils/logger_utils.dart';
import 'package:van_android_getx/features/browser/browser_page.dart';
import 'package:van_android_getx/features/home/vm/home_vm.dart';
import 'package:van_android_getx/features/home/widgets/article_item_widget.dart';
import 'package:van_android_getx/features/home/widgets/auto_scroll_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    LogUtil.d("首页重建了");
    final vm = Get.put(HomeVM());
    return RefreshIndicator(
        onRefresh: () => vm.fetchArticleList(isRefresh: true),
        // 包裹一个可观察组件
        child: Obx(() {
          // ScrollController 实例必须写在这里，写在VM里，会导致无法下拉刷新
          var scrollController = ScrollController();
          scrollController.addListener(() {
            // 列表滑动到底部加载更多
            if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
              vm.fetchArticleList();
            }
          });
          return ListView.builder(
              controller: scrollController,
              // 列表长度为数据长度+1,0用来显示Banner
              itemCount: vm.homeArticleInfoItems.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return AutoScrollBannerWidget(
                      imageUrls: vm.bannerItems.map((element) => element.imagePath).toList(),
                      onTap: (pos) {
                        Get.to(BrowserPage(url: vm.bannerItems[pos].url));
                      });
                } else {
                  return ArticleItemWidget(articleInfo: vm.homeArticleInfoItems[index - 1]);
                }
              });
        }));
  }
}
