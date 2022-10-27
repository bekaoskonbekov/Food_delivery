import 'package:flutter/material.dart';

import 'colors.dart';

const primaryColor = Color(0xff082659);
const secondaryColor = Color(0xff51eec2);

final appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: appBarColor,
      // centerTitle: true,
    ),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: mainColor,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: mainColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: mainColor,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: secondaryFontColor),
        iconColor: secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        )));
