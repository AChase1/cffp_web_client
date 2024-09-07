import 'package:cffp_web/api/models/schedule.dart';
import 'package:cffp_web/api/providers/login_provider.dart';
import 'package:cffp_web/api/providers/picks_provider.dart';
import 'package:cffp_web/games_page/gui/picks_panel/game_matchup/pick_team_button.dart';
import 'package:cffp_web/games_page/gui/picks_panel/game_matchup/versus_text.dart';
import 'package:cffp_web/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameMatchup extends ConsumerStatefulWidget {
  final Map<dynamic, dynamic>? matchup;
  final String? selectedWeek;
  final int currentIndex;
  const GameMatchup({
    super.key,
    required this.matchup,
    required this.selectedWeek,
    required this.currentIndex,
  });

  @override
  ConsumerState<GameMatchup> createState() => _GameMatchupState();
}

class _GameMatchupState extends ConsumerState<GameMatchup> {
  late bool isHomeSelected;
  late bool isAwaySelected;

  @override
  void initState() {
    super.initState();
    isAwaySelected = false;
    isHomeSelected = false;
  }

  void updateHomeSelection() {
    if (widget.matchup != null) {
      String teamPickName = widget.matchup!['home']['abb'];
      final member = ref.read(loginProvider.notifier).getCurrMember();
      ref.read(picksProvider.notifier).changePick(member, widget.matchup!['i'], teamPickName);
      setState(() {
        isHomeSelected = !isHomeSelected;
        // print("home selected ==> $isHomeSelected");
        isAwaySelected = isAwaySelected == false
            ? false
            : isHomeSelected
                ? false
                : true;
        // print("away selected ==> $isAwaySelected");
      });
    }
  }

  void updateAwaySelection() {
    if (widget.matchup != null) {
      String teamPickName = widget.matchup!['away']['abb'];
      final member = ref.read(loginProvider.notifier).getCurrMember();
      ref.read(picksProvider.notifier).changePick(member, widget.matchup!['i'], teamPickName);
      setState(() {
        isAwaySelected = !isAwaySelected;
        isHomeSelected = isHomeSelected == false
            ? false
            : isAwaySelected
                ? false
                : true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PickTeamButton(
            team: widget.matchup?["away"],
            isHome: false,
            onClick: () => updateAwaySelection(),
            isSelected: isAwaySelected,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: VersusText(),
        ),
        Expanded(
          child: PickTeamButton(
            team: widget.matchup?["home"],
            isHome: true,
            onClick: () => updateHomeSelection(),
            isSelected: isHomeSelected,
          ),
        ),
      ],
    );
  }
}
