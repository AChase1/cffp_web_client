import 'package:cffp_web/games_page/data/games_page_model.dart';
import 'package:flutter/material.dart';

class GameMatchup extends StatefulWidget {
  final Matchup matchup;
  const GameMatchup({super.key, required this.matchup});

  @override
  State<GameMatchup> createState() => _GameMatchupState();
}

class _GameMatchupState extends State<GameMatchup> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
