import 'dart:math';
import 'package:flutter/material.dart';

// 获取一个随机颜色值
Color getRandomColor() {
  final Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
    1, // Alpha
  );
}
