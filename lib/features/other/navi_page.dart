import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/core/utils/color_utils.dart';
import 'package:van_android_getx/data/model/navi_info.dart';
import 'package:van_android_getx/features/browser/browser_page.dart';
import 'package:van_android_getx/features/other/navi_vm.dart';

class NaviPage extends StatelessWidget {
  const NaviPage({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Get.put(NaviVM());
    var scrollController = ScrollController();
    var showFab = false.obs; // 悬浮按钮是否显示的可观察变量
    return Obx(() {
      if (vm.naviInfoItems.isNotEmpty) {
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
                onRefresh: () => vm.fetchNavi(),
                child: Obx(() {
                  scrollController.addListener(() {
                    // 根据滑动距离控制悬浮按钮的显示隐藏
                    if (scrollController.position.pixels > 200) {
                      showFab.value = true;
                    } else if (scrollController.position.pixels <= 200) {
                      showFab.value = false;
                    }
                  });
                  return ListView.builder(
                      controller: scrollController,
                      itemCount: vm.naviInfoItems.length,
                      itemBuilder: (context, index) {
                        return _generateNaviItem(vm.naviInfoItems[index]);
                      });
                })));
      } else {
        return Container();
      }
    });
  }

  // 生成导航列表项
  Widget _generateNaviItem(NaviInfo info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 导航分类标题
        Container(
            height: 40,
            alignment: Alignment.center,
            child: Text("${info.name}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        // 判断数据不为空才显示流式标签
        info.articles == null
            ? Container()
            : Wrap(
                direction: Axis.horizontal,
                spacing: 4.0, // 水平间距
                runSpacing: 2.0, // 垂直间距
                children: info.articles!.map((e) {
                  return GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // 生成随机颜色的文字
                        child: Text("${e.title}", style: TextStyle(color: getRandomColor())),
                      ),
                      onTap: () {
                        if (null != e.link) Get.to(BrowserPage(url: e.link!));
                      });
                }).toList(),
              )
      ],
    );
  }
}
