import 'package:cffp_web/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

ColorScheme colorTheme() {
  return ColorScheme.fromSeed(
    seedColor: AppColors.white,
    primary: AppColors.white,
    onPrimary: AppColors.darkBlue,
    primaryContainer: AppColors.white,
    onPrimaryContainer: AppColors.darkBlue,
    secondary: AppColors.oceanBlue,
    onSecondary: AppColors.darkBlue,
    secondaryContainer: AppColors.oceanBlue,
    onSecondaryContainer: AppColors.darkBlue,
    tertiary: AppColors.darkBlue,
    onTertiary: AppColors.white,
    tertiaryContainer: AppColors.darkBlue,
    onTertiaryContainer: AppColors.white,
    error: AppColors.red,
    onError: AppColors.white,
    errorContainer: AppColors.white,
    onErrorContainer: AppColors.red,
  );
}
