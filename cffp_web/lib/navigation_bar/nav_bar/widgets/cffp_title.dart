import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CffpTitle extends StatelessWidget {
  const CffpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "CFFP",
      style: context.fonts.displayLarge?.copyWith(
        color: context.colors.tertiary,
      ),
    );
  }
}
