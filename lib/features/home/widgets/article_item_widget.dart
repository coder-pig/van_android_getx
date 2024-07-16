import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_android_getx/features/account/login_page.dart';
import 'package:van_android_getx/features/browser/browser_page.dart';

import '../../../data/model/home_article_info.dart';

class ArticleItemWidget extends StatelessWidget {
  const ArticleItemWidget({super.key, required this.articleInfo});

  final ArticleInfo articleInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.topLeft,
              child: Text(
                articleInfo.title,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              )),
          const SizedBox(height: 4.0),
          Row(
            children: [
              const SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  articleInfo.author,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Text(
                articleInfo.superChapterName,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(width: 12.0),
              Text(
                articleInfo.niceDate,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(width: 12.0),
            ],
          ),
          const SizedBox(height: 8.0),
          const Divider(height: 1, color: Colors.grey, thickness: 0.5),
        ],
      ),
      onTap: () {
        Get.to(BrowserPage(url: articleInfo.link));
      },
    );
  }
}