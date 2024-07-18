import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 展示一个Loading对话框
void showLoadingDialog({bool canPop = true}) {
  Get.dialog(
      WillPopScope(
          onWillPop: () async => canPop, // 根据canPop参数决定是否允许关闭对话框
          child: Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // 指定一个固定不变的颜色
                    CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Get.theme.primaryColor)),
                  ],
                ),
              ),
            ),
          )),
      barrierDismissible: false);
}

/// 展示一个退出App的确认弹窗
Future<bool> showExitConfirmDialog() async =>
    await Get.dialog(
      AlertDialog(
        title: const Text('退出应用'),
        content: const Text('你确定要退出应用吗？'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false), // 不退出应用
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true), // 确认退出应用
            child: const Text('确定'),
          ),
        ],
      ),
    ) ??
    false; // 防止点击对话框外部时返回null
