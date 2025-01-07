import 'package:cffp_web/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../api/models/gametimes.dart';
import '../api/models/schedule.dart';
import '../api/models/teams.dart';
import '../games_page/gui/picks_panel/game_matchup/game_matchup.dart';
import '../games_page/gui/picks_panel/save_button.dart';
import '../theme/decorations/container_decoration.dart';

class PlayoffPage extends StatefulWidget {
  const PlayoffPage({super.key});
  @override
  State<StatefulWidget> createState() => _PlayoffPage();
}

class _PlayoffPage extends State<PlayoffPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      width: 550.0,
      decoration: containerDecoration(context: context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Column(
                children: [
                  Divider(
                    endIndent: 0,
                    indent: 0,
                    thickness: 2,
                    color: context.colors.onPrimary,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: PicksPanel(),
                  )
                ],
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: SaveButton(),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 30.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Expanded(
            //         child: Align(
            //           alignment: Alignment.topLeft,
            //           child: Padding(
            //             padding: EdgeInsets.only(top: 18.0),
            //             child: PicksPanelAwayTitle(),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: Align(
            //           alignment: Alignment.topCenter,
            //           child: GameTimeTitle(
            //             allGameTimes: allGameTimes,
            //             selectedGameTime: selectedGameTime,
            //             onItemClick: (time) => udpateSelectedGameTime(gameTime: time),
            //           ),
            //         ),
            //       ),
            //       const Expanded(
            //         child: Align(
            //           alignment: Alignment.topRight,
            //           child: Padding(
            //             padding: EdgeInsets.only(top: 18.0),
            //             child: PicksPanelHomeTitle(),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class PicksPanel extends StatefulWidget {
  const PicksPanel({super.key});

  @override
  State<StatefulWidget> createState() => _PicksPanel();
}

class _PicksPanel extends State<PicksPanel> {
  var selectedMatchups = [
    {
      "i": 0,
      "away": teams["lac"],
      "day": GameTimes.sat430pm,
      "home": teams["hou"],
      "pick": PickType.none,
    },
    {
      "i": 1,
      "away": teams["pit"],
      "day": GameTimes.sat800pm,
      "home": teams["bal"],
      "pick": PickType.none,
    },
    {
      "i": 2,
      "away": teams["den"],
      "day": GameTimes.sun100pm,
      "home": teams["buf"],
      "pick": PickType.none,
    },
    {
      "i": 3,
      "away": teams["gb"],
      "day": GameTimes.sun425pm,
      "home": teams["phi"],
      "pick": PickType.none,
    },
    {
      "i": 4,
      "away": teams["was"],
      "day": GameTimes.sun820pm,
      "home": teams["tb"],
      "pick": PickType.none,
    },
    {
      "i": 5,
      "away": teams["min"],
      "day": GameTimes.mon815pm,
      "home": teams["lar"],
      "pick": PickType.none,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550.0,
      width: 600.0,
      child: ListView.builder(
        itemCount: selectedMatchups.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: GameMatchup(
              currentIndex: index,
              matchup: selectedMatchups[index],
              selectedWeek: '999',
            ),
          );
        },
      ),
    );
  }
}
