import 'package:flutter/material.dart';
import 'package:news_app/core/theme/core/app_colors.dart';

class AppColorScheme {
  AppColorScheme._();

  static ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.surface,
    secondary: AppColors.secondary,
    onSecondary: AppColors.surface,
    error: Colors.red,
    onError: AppColors.surface,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    background: AppColors.background,
    onBackground: AppColors.surface,
  );
}
