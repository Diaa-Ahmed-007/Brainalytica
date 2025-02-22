import 'package:doctors/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.onPrimaryColor,
      secondary: AppColors.textColor,
    ),
  );
}
