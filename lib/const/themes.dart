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

const Color laMuPink = Color(0xFFFFB6C1);

final ThemeData laMuPinkTheme = ThemeData.light().copyWith(
  primaryColor: laMuPink,
  colorScheme: ColorScheme.fromSeed(seedColor: laMuPink),
  appBarTheme: const AppBarTheme(
    backgroundColor: laMuPink,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
);
