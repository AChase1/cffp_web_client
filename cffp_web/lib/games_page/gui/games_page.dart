import 'package:cffp_web/games_page/data/games_page_model.dart';
// import 'package:cffp_web/games_page/gui/widgets/week_game_panels/week_picks_panel.dart';
import 'package:cffp_web/games_page/gui/widgets/week_nav_menu/week_nav_menu.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  Week selectedWeek = Week.week1;

  void updateSelectedWeek(Week week) {
    setState(() {
      selectedWeek = week;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        WeekNavMenu(
          onWeekClick: (week) => updateSelectedWeek(week),
          selectedWeek: selectedWeek,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: VerticalDivider(
            width: 4.0,
            color: context.colors.tertiary,
            indent: 30.0,
            endIndent: 30.0,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // WeekGamePanel(selectedWeek: selectedWeek),
              SizedBox.shrink()
            ],
          ),
        )
      ],
    );
  }
}
