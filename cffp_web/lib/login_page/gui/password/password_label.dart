import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PasswordLabel extends StatelessWidget {
  const PasswordLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Please enter your password:",
      style: context.fonts.bodyLarge?.copyWith(color: context.colors.tertiary),
    );
  }
}
