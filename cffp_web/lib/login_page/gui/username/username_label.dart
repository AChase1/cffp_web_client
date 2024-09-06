import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class UsernameLabel extends StatelessWidget {
  const UsernameLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Please enter your username:",
      style: context.fonts.bodyLarge?.copyWith(color: context.colors.tertiary),
    );
  }
}
