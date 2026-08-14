import 'package:flutter/material.dart';
import 'package:news_app/core/theme/src/app_app_bar_theme.dart';
import 'package:news_app/core/theme/src/app_color_scheme.dart';
import 'package:news_app/core/theme/src/app_text_theme.dart';
import 'package:news_app/core/theme/src/input_decoration_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColorScheme.lightColorScheme,
    scaffoldBackgroundColor: AppColorScheme.lightColorScheme.background,
    textTheme: AppTextTheme.lightTextTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: AppInputDecorationTheme.lightColorScheme,
  );
}
