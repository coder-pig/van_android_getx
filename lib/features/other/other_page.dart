import 'package:flutter/material.dart';

import 'navi_page.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) => const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(tabs: [Tab(text: "网站导航"), Tab(text: "学习体系")]),
          Expanded(child: TabBarView(children: [NaviPage(), Text("学习体系")]))
        ],
      ));
}
