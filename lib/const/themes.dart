import 'package:flutter/material.dart';

const Color leiMuBlue = Color(0xFF5A78EA);

final ThemeData leiMuBlueTheme = ThemeData.light().copyWith(
  primaryColor: leiMuBlue,
  colorScheme: ColorScheme.fromSeed(seedColor: leiMuBlue),
  appBarTheme: const AppBarTheme(
    backgroundColor: leiMuBlue,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
);
