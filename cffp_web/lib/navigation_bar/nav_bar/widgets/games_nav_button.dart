import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GamesNavButton extends StatefulWidget {
  const GamesNavButton({super.key});

  @override
  State<GamesNavButton> createState() => _GamesNavButtonState();
}

class _GamesNavButtonState extends State<GamesNavButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {},
      child: Text(
        "GAMES",
        style: context.fonts.headlineSmall?.copyWith(
          color: context.colors.tertiary,
          fontSize: 25.0,
        ),
      ),
    );
  }
}
