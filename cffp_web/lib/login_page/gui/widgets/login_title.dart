import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Login",
      style:
          context.fonts.displayMedium?.copyWith(color: context.colors.tertiary),
    );
  }
}
