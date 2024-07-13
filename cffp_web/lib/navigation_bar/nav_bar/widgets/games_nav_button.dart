import 'package:cffp_web/router/app_router.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GamesNavButton extends StatefulWidget {
  final bool isGamesPage;
  const GamesNavButton({super.key, required this.isGamesPage});

  @override
  State<GamesNavButton> createState() => _GamesNavButtonState();
}

class _GamesNavButtonState extends State<GamesNavButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        context.goNamed(gamesPageRouteName);
      },
      child: Text(
        "GAMES",
        style: context.fonts.headlineSmall?.copyWith(
          color: widget.isGamesPage ? context.colors.tertiary : context.colors.tertiary.withOpacity(0.3),
          fontSize: 25.0,
        ),
      ),
    );
  }
}
