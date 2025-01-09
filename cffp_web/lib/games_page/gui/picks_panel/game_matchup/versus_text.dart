import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class VersusText extends StatelessWidget {
  const VersusText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "VS",
        style: context.fonts.bodyLarge?.copyWith(color: context.colors.onPrimary),
      ),
    );
  }
}
