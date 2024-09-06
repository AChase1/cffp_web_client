import 'package:cffp_web/api/models/schedule.dart';
import 'package:cffp_web/games_page/gui/week_nav_menu/week_button.dart';
import 'package:flutter/material.dart';

class WeekNavMenu extends StatelessWidget {
  final Function(String?) onWeekClick;
  final String? selectedWeek;
  const WeekNavMenu(
      {super.key, required this.onWeekClick, required this.selectedWeek});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550.0,
      width: 120.0,
      child: ListView.builder(
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          return WeekButton(
            selectedWeek: selectedWeek,
            week: schedule.keys.toList()[index],
            onClick: (week) => onWeekClick(week),
          );
        },
      ),
    );
  }
}
