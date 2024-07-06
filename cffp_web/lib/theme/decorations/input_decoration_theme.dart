import 'package:cffp_web/theme/colors/more_colors_theme.dart';
import 'package:cffp_web/theme/fonts/text_theme.dart';
import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    isCollapsed: true,
    isDense: true,
    filled: true,
    fillColor: moreColorsTheme().textFieldBackground,
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    hintStyle: textTheme().bodyLarge?.copyWith(
          color: moreColorsTheme().onTextFieldBackground.withOpacity(0.5),
        ),
    labelStyle: textTheme().bodyLarge,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        style: BorderStyle.none,
        width: 0,
      ),
    ),
  );
}
