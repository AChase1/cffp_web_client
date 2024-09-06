import 'package:cffp_web/games_page/gui/picks_panel/game_matchup/game_matchup.dart';
import 'package:flutter/material.dart';

class PicksPanelPicksList extends StatelessWidget {
  final List<dynamic> selectedMatchups;
  final String? selectedWeek;
  const PicksPanelPicksList({
    super.key,
    required this.selectedMatchups,
    required this.selectedWeek,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375.0,
      width: 600.0,
      child: ListView.builder(
        itemCount: selectedMatchups.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: GameMatchup(
              currentIndex: index,
              matchup: selectedMatchups[index],
              selectedWeek: selectedWeek,
            ),
          );
        },
      ),
    );
  }
}
