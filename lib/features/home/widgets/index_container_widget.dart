import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/wx_article_page.dart';

import '../../../other_page.dart';
import '../pages/home_page.dart';
import '../vm/home_page_vm.dart';


class IndexContainerWidget extends StatelessWidget {
  const IndexContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageVM vm = Get.find<HomePageVM>();
    return Expanded(
        child: PageView(
          controller: vm.indexPageController,
          onPageChanged: (index) {
            vm.tabIndex.value = index;
          },
          children: const <Widget>[
            HomePage(key: PageStorageKey("home")),
            WxArticlePage(key: PageStorageKey("wx_article")),
            OtherPage(key: PageStorageKey("other"))
          ],
        ));
  }
}
