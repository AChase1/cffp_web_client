import 'package:cffp_widgets/theme/colors/color_theme.dart';
import 'package:cffp_widgets/theme/colors/more_colors_theme.dart';
import 'package:cffp_widgets/theme/decorations/input_decoration_theme.dart';
import 'package:cffp_widgets/theme/fonts/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData darkTheme() {
    return ThemeData(
      colorScheme: colorTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
    );
  }
}

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get fonts => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  MoreColors get moreColors =>
      theme.extension<MoreColors>() ?? moreColorsTheme();
}
