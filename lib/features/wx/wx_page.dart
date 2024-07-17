import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/features/wx/wx_article_list_page.dart';
import 'package:van_android_getx/features/wx/wx_vm.dart';

class WxPage extends StatelessWidget {
  const WxPage({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Get.put(WxVM());
    return Obx(() {
      // 判断有数据才初始化Tab
      if (vm.wxAccounts.isEmpty) {
        return Container();
      } else {
        return Column(children: [
          TabBar(
            isScrollable: true, //设置为可以滚动，不然会显示补全
            tabs: vm.wxAccounts.map((e) => e.name).toList().map((e) => Tab(text: e)).toList(),
            controller: vm.tabController,
          ),
          Expanded(
              child: TabBarView(
                  controller: vm.tabController,
                  children: vm.wxAccounts.map((e) => e.id).map((id) => WxArticleListPage(wxId: id!)).toList())),
        ]);
      }
    });
  }
}
