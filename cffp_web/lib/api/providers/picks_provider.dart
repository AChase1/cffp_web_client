import 'package:cffp_web/api/gsheets/creds.dart';
import 'package:cffp_web/api/models/members.dart';
import 'package:cffp_web/api/providers/week_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Map sorted by each member's name as the key, value a list of picks for current week
final picksProvider = AsyncNotifierProvider<PicksProviderNotifier, Map<String, List<String>>>(PicksProviderNotifier.new);

class PicksProviderNotifier extends AsyncNotifier<Map<String, List<String>>> {
  @override
  Future<Map<String, List<String>>> build() async {
    final currWeek = ref.watch(weekProvider);
    return await _getCurrPicks(currWeek);
  }

  Future<Map<String, List<String>>> _getCurrPicks(String week) async {
    var picks = <String, List<String>>{};
    for (final m in members.keys) {
      var result = await getPicks(m, week);
      picks.addEntries(<String, List<String>>{m: result}.entries);
    }
    return picks;
  }

  Future<void> getCurrPicks(String week) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _getCurrPicks(week);
    });
  }
}
