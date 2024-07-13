import 'package:cffp_web/games_page/data/games_page_model.dart';
import 'package:cffp_web/games_page/gui/widgets/week_nav_menu/week_button.dart';
import 'package:flutter/material.dart';

class WeekNavMenu extends StatelessWidget {
  final Function(Week) onWeekClick;
  final Week selectedWeek;
  const WeekNavMenu(
      {super.key, required this.onWeekClick, required this.selectedWeek});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550.0,
      width: 125.0,
      child: ListView.builder(
        itemCount: Week.values.length,
        itemBuilder: (context, index) {
          return WeekButton(
            selectedWeek: selectedWeek,
            week: Week.values[index],
            onClick: (week) => onWeekClick(week),
          );
        },
      ),
    );
  }
}
