import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/features/home/widgets/article_item_widget.dart';
import 'package:van_android_getx/features/main/main_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Get.find<MainVM>();
    return RefreshIndicator(
        onRefresh: () => vm.fetchHomeArticleInfoItems(isRefresh: true),
        child: Obx(() {
          var scrollController = ScrollController();
          scrollController.addListener(() {
            if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
              vm.fetchHomeArticleInfoItems();
            }
          });
          return ListView.builder(
              controller: scrollController,
              itemCount: vm.homeArticleInfoItems.length,
              itemBuilder: (context, index) => ArticleItemWidget(articleInfo: vm.homeArticleInfoItems[index]));
        }));
  }
}
