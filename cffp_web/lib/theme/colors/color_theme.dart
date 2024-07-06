import 'package:cffp_web/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

ColorScheme colorTheme() {
  return ColorScheme.fromSeed(
    seedColor: AppColors.darkNavy,
    primary: AppColors.darkNavy,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.darkNavy,
    onPrimaryContainer: AppColors.white,
    secondary: AppColors.navy,
    onSecondary: AppColors.white,
    secondaryContainer: AppColors.navy,
    onSecondaryContainer: AppColors.white,
    tertiary: AppColors.bronzeGold,
    onTertiary: AppColors.darkNavy,
    tertiaryContainer: AppColors.bronzeGold,
    onTertiaryContainer: AppColors.darkNavy,
    error: AppColors.red,
    onError: AppColors.white,
    errorContainer: AppColors.white,
    onErrorContainer: AppColors.red,
  );
}
