import 'package:cffp_web/api/models/schedule.dart';

class User {
  String? name;
  Map<String, List<dynamic>>? pickSchedule;

  User({this.name, this.pickSchedule});

  void updatePick({
    required String selectedWeek,
    required String teamName,
    required PickType pick,
  }) {
    pickSchedule?[selectedWeek]?.firstWhere(
      (element) =>
          ((element as Map<String, dynamic>)["away"]
                  as Map<String, dynamic>)["name"] ==
              teamName ||
          ((element)["home"] as Map<String, dynamic>)["name"] == teamName,
    )["pick"] = pick;
  }
}
