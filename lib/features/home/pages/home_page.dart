import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/features/browser/browser_page.dart';
import 'package:van_android_getx/features/home/vm/home_vm.dart';
import 'package:van_android_getx/features/home/widgets/article_item_widget.dart';
import 'package:van_android_getx/features/home/widgets/auto_scroll_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    var showFab = false.obs; // 悬浮按钮是否显示的可观察变量
    final vm = Get.put(HomeVM());
    return Scaffold(
        floatingActionButton: Obx(() => showFab.value
            ? FloatingActionButton(
                onPressed: () {
                  scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: const Icon(Icons.arrow_upward),
              )
            : Container()),
        body: RefreshIndicator(
            onRefresh: () => vm.fetchArticleList(isRefresh: true),
            child: Obx(() {
              scrollController.addListener(() {
                // 根据滑动距离控制悬浮按钮的显示隐藏
                if (scrollController.position.pixels > 200) {
                  showFab.value = true;
                } else if (scrollController.position.pixels <= 200) {
                  showFab.value = false;
                }
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
            })));
  }
}
