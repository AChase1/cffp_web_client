import 'package:cffp_web/router/app_router.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StandingsNavButton extends StatefulWidget {
  final bool isStandingsPage;
  const StandingsNavButton({super.key, required this.isStandingsPage});

  @override
  State<StandingsNavButton> createState() => _StandingsNavButtonState();
}

class _StandingsNavButtonState extends State<StandingsNavButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        context.goNamed(standingsPageRouteName);
      },
      child: Text(
        "STANDINGS",
        style: context.fonts.headlineSmall?.copyWith(
          color: widget.isStandingsPage
              ? context.colors.tertiary
              : context.colors.tertiary.withOpacity(0.3),
          fontSize: 25.0,
        ),
      ),
    );
  }
}
