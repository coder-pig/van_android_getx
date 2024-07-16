import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AutoScrollBannerWidget extends StatefulWidget {
  final List<String> imageUrls;
  final Function(int pos) onTap;

  const AutoScrollBannerWidget({super.key, required this.imageUrls, required this.onTap});

  @override
  State<StatefulWidget> createState() => _AutoScrollBannerWidgetState();
}

class _AutoScrollBannerWidgetState extends State<AutoScrollBannerWidget> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // 为了无限轮播，把_currentPage设置在一个较大的值
    _currentPage = widget.imageUrls.length * 10000;
    // 初始化页面控制器
    _pageController = PageController(initialPage: _currentPage);
    // 启动定时器，每3秒切换页面
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      //  计算下个页面索引
      int nextPageIndex = _pageController.page!.toInt() + 1;
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          nextPageIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    // 组件销毁时，取消定时器，释放资源
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: widget.imageUrls.isNotEmpty
          ? PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) {
                // 取余获得真正有效的index
                var trueIndex = index % widget.imageUrls.length;
                return GestureDetector(
                  onTap: () => widget.onTap(trueIndex),
                  child: CachedNetworkImage(
                      imageUrl: widget.imageUrls[trueIndex],
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error)),
                );
              },
              onPageChanged: (index) {
                _currentPage = index;
              },
            )
          : Container()
    );
  }
}
