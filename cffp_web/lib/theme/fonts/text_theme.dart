import 'package:cffp_web/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

const String brotherFontFamilyTitle = "Brother";
const String graduateFontFamilyTitle = "Graduate";

const double bodySmallSize = 12.0;
const double bodyMediumSize = 14.0;
const double bodyLargeSize = 15.0;

const double headlineSmallSize = 20.0;
const double headlineMediumSize = 30.0;
const double headlineLargeSize = 40.0;

const double displaySmallSize = 45.0;
const double displayMediumSize = 55.0;
const double displayLargeSize = 60.0;

const TextStyle baseBrotherStyle = TextStyle(
  color: AppColors.white,
  fontFamily: brotherFontFamilyTitle,
);

const TextStyle baseGraduateStyle = TextStyle(
  color: AppColors.white,
  fontFamily: graduateFontFamilyTitle,
);

TextTheme textTheme() {
  return TextTheme(
    bodySmall: baseBrotherStyle.copyWith(
      fontSize: bodySmallSize,
    ),
    bodyMedium: baseBrotherStyle.copyWith(
      fontSize: bodyMediumSize,
    ),
    bodyLarge: baseBrotherStyle.copyWith(
      fontSize: bodyLargeSize,
    ),
    headlineSmall: baseBrotherStyle.copyWith(
      fontSize: headlineSmallSize,
    ),
    headlineMedium: baseBrotherStyle.copyWith(
      fontSize: headlineMediumSize,
    ),
    headlineLarge: baseBrotherStyle.copyWith(
      fontSize: headlineLargeSize,
    ),
    displaySmall: baseGraduateStyle.copyWith(
      fontSize: displaySmallSize,
    ),
    displayMedium: baseGraduateStyle.copyWith(
      fontSize: displayMediumSize,
    ),
    displayLarge: baseGraduateStyle.copyWith(
      fontSize: displayLargeSize,
    ),
  );
}
