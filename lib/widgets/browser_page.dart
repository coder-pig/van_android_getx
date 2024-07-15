import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BrowserPage extends StatelessWidget {
  const BrowserPage({super.key, required this.url});

  final String url;

  // 复制URL到剪切板
  void _copyUrlToClipboard() {
    Clipboard.setData(ClipboardData(text: url));
    Get.snackbar("提示", "链接已复制到剪贴板");
  }

  // 跳转手机浏览器
  void _openBrowser() async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = true.obs; // 网页是否正在加载中
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        title: const Text('Van ♂ Android'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.copy, color: Colors.white),
            onPressed: _copyUrlToClipboard,
          ),
          IconButton(
            icon: const Icon(Icons.open_in_browser, color: Colors.white),
            onPressed: _openBrowser,
          ),
        ],
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(url)),
            onLoadStart: (InAppWebViewController controller, Uri? url) {
              isLoading.value = true; // 页面开始加载，更新状态为 true
            },
            // 页面停止加载时的回调
            onLoadStop: (InAppWebViewController controller, Uri? url) {
              isLoading.value = false; // 页面停止加载，更新状态为 false
            },
          ),
          Obx(() {
            if (isLoading.value) {
              // 如果正在加载，则显示圆形进度指示器
              return const Center(child: CircularProgressIndicator());
            } else {
              // 如果不是，则不显示任何内容
              return Container();
            }
          })
        ],
      ),
    );
  }
}
