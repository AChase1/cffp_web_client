import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class StandingsNavButton extends StatefulWidget {
  const StandingsNavButton({super.key});

  @override
  State<StandingsNavButton> createState() => _StandingsNavButtonState();
}

class _StandingsNavButtonState extends State<StandingsNavButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {},
      child: Text(
        "STANDINGS",
        style: context.fonts.headlineLarge?.copyWith(
          color: context.colors.tertiary,
          fontSize: 25.0,
        ),
      ),
    );
  }
}
