import 'package:cffp_web/games_page/data/games_page_model.dart';
import 'package:cffp_web/games_page/functions/game_page_functions.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WeekTitle extends StatelessWidget {
  final Week selectedWeek;
  const WeekTitle({super.key, required this.selectedWeek});

  @override
  Widget build(BuildContext context) {
    return Text(
      getWeekString(selectedWeek),
      style: context.fonts.displaySmall?.copyWith(
        color: context.colors.tertiary,
        fontSize: 35.0,
      ),
    );
  }
}
