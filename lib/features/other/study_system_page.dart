import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/core/utils/toast_utils.dart';
import 'package:van_android_getx/data/model/study_system_info.dart';
import 'package:van_android_getx/features/other/study_system_vm.dart';

class StudySystemPage extends StatelessWidget {
  const StudySystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Get.put(StudySystemVM());
    var scrollController = ScrollController();
    var showFab = false.obs; // 悬浮按钮是否显示的可观察变量
    return Obx(() {
      if (vm.studySystemItems.isNotEmpty) {
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
                onRefresh: () => vm.fetchStudySystem(),
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
                      itemCount: vm.studySystemItems.length,
                      itemBuilder: (context, index) {
                        return _generateNaviItem(vm.studySystemItems[index], context);
                      });
                })));
      } else {
        return Container();
      }
    });
  }

  // 生成学习体系列表项
  Widget _generateNaviItem(StudySystemInfo info, BuildContext context) {
    return GestureDetector(
        child: Row(children: [
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.only(left: 12, top: 12),
                child: Text("${info.name}",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor))),
            Padding(
                padding: const EdgeInsets.only(left: 12, top: 10, bottom: 10),
                child: info.children != null
                    ? Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: info.children!
                            .map((e) => Text(e.name ?? "",
                                style: const TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic)))
                            .toList())
                    : Container()),
            const Divider(height: 1, color: Color(0xFFE0E0E0))
          ])),
          const Icon(Icons.chevron_right)
        ]),
        onTap: () {
          showToast(msg: "点击了：${info.name}");
        });
  }
}
