import 'package:flutter/material.dart';

import '../core/colors.dart';

final light = ThemeData(
  colorScheme: const ColorScheme.light(primary: AppColors.white),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.amberAccent,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(8.0),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE8E8E8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.amber),
    ),
  ),
);
