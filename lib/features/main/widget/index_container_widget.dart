import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/features/home/pages/home_page.dart';
import 'package:van_android_getx/features/wx/wx_page.dart';
import 'package:van_android_getx/widgets/keep_alive_wrapper.dart';

import '../../../other_page.dart';
import '../main_vm.dart';

class IndexContainerWidget extends StatelessWidget {
  const IndexContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MainVM vm = Get.find<MainVM>();
    return Expanded(
        child: PageView(
            controller: vm.mainPageController,
            onPageChanged: (index) {
              vm.tabIndex.value = index;
            },
            children: const [
              KeepAliveWrapper(child: HomePage()),
              KeepAliveWrapper(child: WxPage()),
              KeepAliveWrapper(child: OtherPage()),
        ]));
  }
}
