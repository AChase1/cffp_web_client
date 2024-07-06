import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

BoxDecoration containerDecoration({
  required final BuildContext context,
  final BorderRadius? borderRadius,
  final List<BoxShadow>? boxShadows,
  final Color? color,
}) {
  return BoxDecoration(
    borderRadius: borderRadius ?? BorderRadius.circular(5.0),
    boxShadow: boxShadows ??
        [
          BoxShadow(
            blurRadius: 3.0,
            spreadRadius: 1.0,
            offset: const Offset(0, 2.0),
            color: context.colors.shadow.withOpacity(0.3),
          ),
        ],
    color: color ?? context.colors.secondaryContainer,
  );
}
