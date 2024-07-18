import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:van_android_getx/widgets/custom_dialog.dart';

import '../home/pages/drawer_page.dart';
import 'widget/index_bottom_bar_widget.dart';
import 'widget/index_container_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          } else {
            final bool shouldPop = await showExitConfirmDialog();
            if (shouldPop) {
              SystemNavigator.pop();
            }
          }
        },
        child: Scaffold(
            appBar: AppBar(title: const Text("Van ♂ Android")),
            body: const Column(
              children: [
                IndexContainerWidget(),
                IndexBottomBarWidget(),
              ],
            ),
            drawer: const DrawerPage()));
  }
}
