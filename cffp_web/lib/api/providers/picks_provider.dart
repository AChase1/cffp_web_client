// import 'package:cffp_web/api/gsheets/creds.dart';
import 'package:cffp_web/api/providers/login_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Map sorted by each member's name as the key, value a list of picks for current week
final picksProvider = AsyncNotifierProvider<PicksProviderNotifier, Map<String, Map<String, List<String>>>>(PicksProviderNotifier.new);

class PicksProviderNotifier extends AsyncNotifier<Map<String, Map<String, List<String>>>> {
  @override
  Future<Map<String, Map<String, List<String>>>> build() async {
    // final currWeek = ref.watch(weekProvider);
    final currMember = ref.read(loginProvider.notifier).getCurrMember();
    if (currMember != null) {
      return await _getCurrPicks(currMember);
    }
    return {};
  }

  /*
  Format of return:

  {
    "aaron": {
      "1": ["cin", "arz", "buf"...],
      "2": ["sea", "lar", "pit"...],
    },
    "ethan": {}
  }
   */
  Future<Map<String, Map<String, List<String>>>> _getCurrPicks(String member) async {
    var picks = <String, Map<String, List<String>>>{};
    // var result = await getAllMemberPicks(member);
    // picks.addEntries(<String, Map<String, List<String>>>{member: result}.entries);
    return picks;
  }

  Future<void> _changePick(String member, int gameIndex, String pick, String week) async {
    // await insertPick(member, gameIndex, pick, week);
  }

  Future<void> _savePicks(String member, List<String> picks) async {}

  Future<void> getCurrPicks(String week) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _getCurrPicks(week);
    });
  }

  void changePick(String member, int gameIndex, String newTeamPick, String week) async {
    print('3.1');
    final prevState = state.asData?.value;
    print('3.2: $prevState');
    if (prevState != null) {
      state = const AsyncLoading();
      state = await AsyncValue.guard(() async {
        print('3.3: $member - $gameIndex - $newTeamPick');
        prevState[member]![week]![gameIndex - 1] = newTeamPick;

        // await _changePick(member, gameIndex, newTeamPick, week);
        return prevState;
      });
    }
  }

  void savePicks(String member) async {
    final prevState = state.asData?.value;
    if (prevState != null) {
      state = const AsyncLoading();
      state = await AsyncValue.guard(() async {
        var currMemberPicks = prevState[member];
        var newPicksList = <String>[];
        if (currMemberPicks != null) {
          for (var i in currMemberPicks.values) {
            newPicksList.addAll(i);
          }
        }

        await _savePicks(member, newPicksList);
        return prevState;
      });
    }
  }

  String? getPick(String member, String week, int gameIndex) {
    return state.asData?.value[member]?[week]?[gameIndex];
  }
}
