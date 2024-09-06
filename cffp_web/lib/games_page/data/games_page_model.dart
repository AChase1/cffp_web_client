import 'package:flutter/material.dart';

enum Week {
  week1,
  week2,
  week3,
  week4,
  week5,
  week6,
  week7,
  week8,
  week9,
  week10,
  week11,
  week12,
  week13,
  week14,
  week15,
  week16,
  week17,
  week18,
}

class Matchup {
  Team? homeTeam;
  Team? visitorTeam;
  DateTime? startTime;

  Matchup({this.homeTeam, this.startTime, this.visitorTeam});

  String printObject() {
    return "Home Team: ${homeTeam?.printObject()}\nVisitor Team: ${visitorTeam?.printObject()}\nStart Time: $startTime";
  }
}

class Team {
  String? name;
  String? record;
  Image? logo;
  List<Color>? teamColors;

  Team({this.logo, this.name, this.record, this.teamColors});

  String printObject() {
    return "Name: $name\nRecord: $record\nTeam Colors: ${teamColors.toString()}";
  }
}
