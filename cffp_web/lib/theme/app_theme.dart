import 'package:flutter/material.dart';

import 'colors/color_theme.dart';
import 'colors/more_colors_theme.dart';
import 'decorations/input_decoration_theme.dart';
import 'fonts/text_theme.dart';

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
  MoreColors get moreColors => theme.extension<MoreColors>() ?? moreColorsTheme();
}
