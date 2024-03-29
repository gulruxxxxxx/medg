import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';

class AppTheme {
  ThemeData lightTheme() {
    final colors = AppColors();
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
      ),
    );
  }
}
