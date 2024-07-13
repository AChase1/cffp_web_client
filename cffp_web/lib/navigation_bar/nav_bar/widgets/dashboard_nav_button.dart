import 'package:cffp_web/router/app_router.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardNavButton extends StatefulWidget {
  final bool isDashboardPage;
  const DashboardNavButton({super.key, required this.isDashboardPage});

  @override
  State<DashboardNavButton> createState() => _DashboardNavButtonState();
}

class _DashboardNavButtonState extends State<DashboardNavButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        context.goNamed(dashboardPageRouteName);
      },
      child: Text(
        "DASHBOARD",
        style: context.fonts.headlineSmall?.copyWith(
          color: widget.isDashboardPage
              ? context.colors.tertiary
              : context.colors.tertiary.withOpacity(0.3),
          fontSize: 25.0,
        ),
      ),
    );
  }
}
