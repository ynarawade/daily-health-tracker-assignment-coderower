import 'package:daily_health_tracker/utils/colors.dart';
import 'package:daily_health_tracker/utils/typography.dart';
import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primaryBlue,
    cardColor: AppColors.lightSurface,
    dividerColor: AppColors.lightDivider,
    textTheme: AppTypographyTheme.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryBlue,
      secondary: AppColors.primaryBlueLight,
      surface: AppColors.lightSurface,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.primaryBlue,
    cardColor: AppColors.darkSurface,
    dividerColor: AppColors.darkDivider,
    textTheme: AppTypographyTheme.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryBlue,
      secondary: AppColors.primaryBlueLight,
      surface: AppColors.darkSurface,
    ),
  );
}
