import 'package:cffp_web/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

MoreColors moreColorsTheme() {
  return MoreColors(
    textFieldBackground: AppColors.white,
    onTextFieldBackground: AppColors.darkNavy,
  );
}

// This is a class that stores the rest of the colors in the app,
// since ColorScheme() only supports a limited amount of colors (3 main colors).
class MoreColors extends ThemeExtension<MoreColors> {
  MoreColors({
    required this.textFieldBackground,
    required this.onTextFieldBackground,
  });

  final Color textFieldBackground;
  final Color onTextFieldBackground;

  // ThemeExtension requires both a copyWith() and lerp() function in
  // order to exist
  @override
  ThemeExtension<MoreColors> copyWith({
    Color? textFieldBackground,
    Color? onTextFieldBackground,
  }) {
    return MoreColors(
        textFieldBackground: textFieldBackground ?? this.textFieldBackground,
        onTextFieldBackground:
            onTextFieldBackground ?? this.onTextFieldBackground);
  }

  @override
  ThemeExtension<MoreColors> lerp(
      covariant ThemeExtension<MoreColors>? other, double t) {
    if (other is! MoreColors) {
      return this;
    }
    return MoreColors(
      textFieldBackground:
          Color.lerp(textFieldBackground, other.textFieldBackground, t)
              as Color,
      onTextFieldBackground:
          Color.lerp(onTextFieldBackground, other.onTextFieldBackground, t)
              as Color,
    );
  }
}
