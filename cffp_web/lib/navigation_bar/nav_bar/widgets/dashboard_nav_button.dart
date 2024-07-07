import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DashboardNavButton extends StatefulWidget {
  const DashboardNavButton({super.key});

  @override
  State<DashboardNavButton> createState() => _DashboardNavButtonState();
}

class _DashboardNavButtonState extends State<DashboardNavButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {},
      child: Text(
        "DASHBOARD",
        style: context.fonts.headlineLarge?.copyWith(
          color: context.colors.tertiary,
          fontSize: 25.0,
        ),
      ),
    );
  }
}
