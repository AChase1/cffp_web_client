import 'package:cffp_widgets/cffp_widgets.dart';
import 'package:flutter/material.dart';

extension ColorExt on Color {
  Color getOpposite({required BuildContext context}) {
    final col = context.colors;
    final cols = context.moreColors;
    final oppositeColorMap = {
      col.primary: col.onPrimary,
      col.onPrimary: col.primary,
      col.primaryContainer: col.onPrimaryContainer,
      col.onPrimaryContainer: col.primaryContainer,
      col.secondary: col.onSecondary,
      col.onSecondary: col.secondary,
      col.secondaryContainer: col.onSecondaryContainer,
      col.onSecondaryContainer: col.secondaryContainer,
      col.tertiary: col.onTertiary,
      col.onTertiary: col.tertiary,
      col.tertiaryContainer: col.onTertiaryContainer,
      col.onTertiaryContainer: col.tertiaryContainer,
      col.error: col.onError,
      col.onError: col.error,
      col.errorContainer: col.onErrorContainer,
      col.onErrorContainer: col.onErrorContainer,
      col.surface: col.onSurface,
      col.onSurface: col.surface,
      cols.textFieldBackground: cols.onTextFieldBackground,
      cols.onTextFieldBackground: cols.textFieldBackground,
    };
    return oppositeColorMap[this] ?? Colors.yellow;
  }
}
