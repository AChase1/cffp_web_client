enum GameTimes {
  wed100pm,
  wed430pm,
  thu1230pm,
  thu430pm,
  thu815pm,
  thu820pm,
  fri300pm,
  fri815pm,
  sat100pm,
  sat430pm,
  sat800pm,
  sun930am,
  sun100pm,
  sun405pm,
  sun425pm,
  sun820pm,
  mon730pm,
  mon800pm,
  mon815pm,
  mon820pm,
  mon830pm,
  mon900pm,
  tbd,
}

extension GametimeToString on GameTimes {
  String gameTimeToString() {
    switch (this) {
      case GameTimes.sun930am:
        return "9:30 AM";
      case GameTimes.thu1230pm:
        return "12:30 PM";
      case GameTimes.sat100pm:
      case GameTimes.sun100pm:
      case GameTimes.wed100pm:
        return "1:00 PM";
      case GameTimes.fri300pm:
        return "3:00 PM";
      case GameTimes.sun405pm:
        return "4:05 PM";
      case GameTimes.sun425pm:
        return "4:25 PM";
      case GameTimes.thu430pm:
      case GameTimes.sat430pm:
      case GameTimes.wed430pm:
        return "4:30 PM";
      case GameTimes.mon730pm:
        return "7:30 PM";
      case GameTimes.mon800pm:
      case GameTimes.sat800pm:
        return "8:00 PM";
      case GameTimes.thu815pm:
      case GameTimes.fri815pm:
      case GameTimes.mon815pm:
        return "8:15 PM";
      case GameTimes.thu820pm:
      case GameTimes.sun820pm:
      case GameTimes.mon820pm:
        return "8:20 PM";
      case GameTimes.mon830pm:
        return "8:30 PM";
      case GameTimes.mon900pm:
        return "9:00 PM";
      default:
        return "";
    }
  }

  String gameDateToString() {
    switch (this) {
      case GameTimes.wed100pm:
      case GameTimes.wed430pm:
        return "WED";
      case GameTimes.thu1230pm:
      case GameTimes.thu430pm:
      case GameTimes.thu815pm:
      case GameTimes.thu820pm:
        return "THU";
      case GameTimes.fri300pm:
      case GameTimes.fri815pm:
        return "FRI";
      case GameTimes.sat100pm:
      case GameTimes.sat430pm:
      case GameTimes.sat800pm:
        return "SAT";
      case GameTimes.sun100pm:
      case GameTimes.sun405pm:
      case GameTimes.sun425pm:
      case GameTimes.sun820pm:
      case GameTimes.sun930am:
        return "SUN";
      case GameTimes.mon730pm:
      case GameTimes.mon800pm:
      case GameTimes.mon815pm:
      case GameTimes.mon820pm:
      case GameTimes.mon830pm:
      case GameTimes.mon900pm:
        return "MON";
      default:
        return "TBD";
    }
  }
}
