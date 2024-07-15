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
