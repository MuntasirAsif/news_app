import 'package:flutter/material.dart';
import 'package:news_app/core/theme/core/app_colors.dart';

class AppAppBarTheme {
  AppAppBarTheme._();
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.surface,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.surface,
    ),
    centerTitle: true,
    elevation: 0,
  );
}