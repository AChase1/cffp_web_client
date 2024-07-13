import 'package:cffp_web/games_page/data/games_page_model.dart';
import 'package:cffp_web/games_page/functions/game_page_functions.dart';
import 'package:cffp_web/games_page/gui/widgets/week_game_panels/week_title.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:cffp_web/theme/decorations/container_decoration.dart';
import 'package:flutter/material.dart';

class WeekGamePanel extends StatelessWidget {
  final Week selectedWeek;
  const WeekGamePanel({super.key, required this.selectedWeek});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      width: 500.0,
      decoration: containerDecoration(context: context),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WeekTitle(selectedWeek: selectedWeek),
          ],
        ),
      ),
    );
  }
}
