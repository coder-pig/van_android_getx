import 'package:flutter/material.dart';

import '../home/pages/drawer_page.dart';
import 'widget/index_bottom_bar_widget.dart';
import 'widget/index_container_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Van ♂ Android")),
        body: const Column(
          children: [
            IndexContainerWidget(),
            IndexBottomBarWidget(),
          ],
        ),
        drawer: const DrawerPage());
  }
}