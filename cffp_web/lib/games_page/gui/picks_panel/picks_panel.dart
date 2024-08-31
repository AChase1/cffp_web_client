import 'package:cffp_web/api/models/gametimes.dart';
import 'package:cffp_web/api/models/schedule.dart';
import 'package:cffp_web/games_page/gui/picks_panel/headers/away_title.dart';
import 'package:cffp_web/games_page/gui/picks_panel/headers/game_time_title.dart';
import 'package:cffp_web/games_page/gui/picks_panel/headers/home_title.dart';
import 'package:cffp_web/games_page/gui/picks_panel/picks_list.dart';
import 'package:cffp_web/theme/app_theme.dart';
import 'package:cffp_web/theme/decorations/container_decoration.dart';
import 'package:flutter/material.dart';

class PicksPanel extends StatefulWidget {
  final String? selectedWeek;
  const PicksPanel({super.key, required this.selectedWeek});

  @override
  State<PicksPanel> createState() => _PicksPanelState();
}

class _PicksPanelState extends State<PicksPanel> {
  late String selectedGameTime;
  late List<dynamic> allGameTimes;

  void udpateSelectedGameTime({required String gameTime}) {
    setState(() {
      selectedGameTime = gameTime;
    });
  }

  @override
  void initState() {
    super.initState();
    allGameTimes = schedule[widget.selectedWeek]
            ?.map(
              (e) =>
                  "${(e["day"] as GameTimes).gameDateToString()} ${(e["day"] as GameTimes).gameTimeToString()}",
            )
            .toSet()
            .toList() ??
        [];
    selectedGameTime = allGameTimes.firstWhere(
      (time) => time.contains("WED") || time.contains("THU"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedMatchups = schedule[widget.selectedWeek]
        ?.where((matchup) =>
            "${(matchup["day"] as GameTimes).gameDateToString()} ${(matchup["day"] as GameTimes).gameTimeToString()}" ==
            selectedGameTime)
        .toSet()
        .toList();
    return Container(
      height: 600.0,
      width: 500.0,
      decoration: containerDecoration(context: context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Column(
                children: [
                  Divider(
                    endIndent: 0,
                    indent: 0,
                    thickness: 2,
                    color: context.colors.tertiary,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: PicksPanelPicksList(
                      selectedMatchups: selectedMatchups ?? [],
                      selectedWeek: widget.selectedWeek,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: PicksPanelAwayTitle(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: GameTimeTitle(
                        allGameTimes: allGameTimes,
                        selectedGameTime: selectedGameTime,
                        onItemClick: (time) =>
                            udpateSelectedGameTime(gameTime: time),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: PicksPanelHomeTitle(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
