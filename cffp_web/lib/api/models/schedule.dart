import 'package:cffp_web/api/models/gametimes.dart';
import 'package:cffp_web/api/models/teams.dart';

enum PickType { home, away, none }

Map<String, List<dynamic>> schedule = {
  "Week 1": [
    {
      "away": teams["bal"],
      "day": GameTimes.thu820pm,
      "home": teams["kc"],
      "pick": PickType.none,
    },
    {
      "away": teams["gb"],
      "day": GameTimes.fri815pm,
      "home": teams["phi"],
      "pick": PickType.none,
    },
    {
      "away": teams["pit"],
      "day": GameTimes.sun100pm,
      "home": teams["atl"],
      "pick": PickType.none,
    },
    {
      "away": teams["ari"],
      "day": GameTimes.sun100pm,
      "home": teams["buf"],
      "pick": PickType.none,
    },
    {
      "away": teams["ten"],
      "day": GameTimes.sun100pm,
      "home": teams["chi"],
      "pick": PickType.none,
    },
    {
      "away": teams["ne"],
      "day": GameTimes.sun100pm,
      "home": teams["cin"],
      "pick": PickType.none,
    },
    {
      "away": teams["hou"],
      "day": GameTimes.sun100pm,
      "home": teams["ind"],
      "pick": PickType.none,
    },
    {
      "away": teams["jax"],
      "day": GameTimes.sun100pm,
      "home": teams["mia"],
      "pick": PickType.none,
    },
    {
      "away": teams["car"],
      "day": GameTimes.sun100pm,
      "home": teams["no"],
      "pick": PickType.none,
    },
    {
      "away": teams["min"],
      "day": GameTimes.sun100pm,
      "home": teams["nyg"],
      "pick": PickType.none,
    },
    {
      "away": teams["lv"],
      "day": GameTimes.sun405pm,
      "home": teams["lac"],
      "pick": PickType.none,
    },
    {
      "away": teams["den"],
      "day": GameTimes.sun405pm,
      "home": teams["sea"],
      "pick": PickType.none,
    },
    {
      "away": teams["dal"],
      "day": GameTimes.sun425pm,
      "home": teams["cle"],
      "pick": PickType.none,
    },
    {
      "away": teams["was"],
      "day": GameTimes.sun425pm,
      "home": teams["tb"],
      "pick": PickType.none,
    },
    {
      "away": teams["lar"],
      "day": GameTimes.sun820pm,
      "home": teams["det"],
      "pick": PickType.none,
    },
    {
      "away": teams["nyj"],
      "day": GameTimes.mon820pm,
      "home": teams["sf"],
      "pick": PickType.none,
    }
  ],
  "Week 2": [],
  "Week 3": [],
  "Week 4": [],
  "Week 5": [],
  "Week 6": [],
  "Week 7": [],
  "Week 8": [],
  "Week 9": [],
  "Week 10": [],
  "Week 11": [],
  "Week 12": [],
  "Week 13": [],
  "Week 14": [],
  "Week 15": [],
  "Week 16": [],
  "Week 17": [],
  "Week 18": [],
};
