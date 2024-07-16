import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/features/home/pages/home_page.dart';
import 'package:van_android_getx/wx_article_page.dart';

import '../../../other_page.dart';
import '../main_vm.dart';

class IndexContainerWidget extends StatelessWidget {
  const IndexContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MainVM vm = Get.find<MainVM>();
    return Expanded(
        child: PageView.builder(
          controller: vm.mainPageController,
          onPageChanged: (index) {
            vm.tabIndex.value = index;
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            switch(index) {
              case 0:
                return const KeyedSubtree(
                  key: PageStorageKey<String>('HomePage'),
                  child: HomePage(),
                );
              case 1:
                return const KeyedSubtree(
                  key: PageStorageKey<String>('WxArticlePage'),
                  child: WxArticlePage(),
                );
              case 2:
                return const KeyedSubtree(
                  key: PageStorageKey<String>('OtherPage'),
                  child: OtherPage(),
                );
              default:
                return const SizedBox.shrink(); // 如果索引不匹配，返回一个空的占位Widget
            }
          }
        )
    );
  }
}
