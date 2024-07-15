import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/features/home/vm/home_page_vm.dart';

class IndexBottomBarWidget extends StatelessWidget {
  const IndexBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) => GetX<HomePageVM>(builder: (vm) {
        // BottomNavigationBar 切换选中的tab需要触发刷新，所以要可观察组件包裹
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            vm.tabIndex.value = index;
            vm.indexPageController.jumpToPage(index);
          },
          // 选中时的颜色
          selectedItemColor: Get.theme.primaryColor,
          // 未选中时的颜色
          unselectedItemColor: Colors.grey,
          // 选中的label是否展示
          showSelectedLabels: true,
          // 未选中的label是否展示
          showUnselectedLabels: true,
          // 当前选中Tab的下标
          currentIndex: vm.tabIndex.value,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: '公众号'),
            BottomNavigationBarItem(icon: Icon(Icons.heart_broken), label: '其它'),
          ],
        );
      });
}
