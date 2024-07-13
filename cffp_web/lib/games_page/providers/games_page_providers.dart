import 'package:cffp_web/games_page/data/games_page_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final allMatchupsProvider =
    NotifierProvider<AllMatchups, List<Matchup>>(AllMatchups.new);

class AllMatchups extends Notifier<List<Matchup>> {
  @override
  List<Matchup> build() {
    return [];
  }

  void addMatchup(Matchup matchup) {
    state.add(matchup);
    ref.notifyListeners();
  }

  void updateMatchup(Matchup matchup) {
    final originalMatchupIndex =
        state.indexWhere((element) => element == matchup);
    final matchupToRemove = state.firstWhere(
      (element) => element == matchup,
    );
    state.remove(matchupToRemove);
    state.insert(originalMatchupIndex, matchup);
    ref.notifyListeners();
  }
}

final currentMatchupsDisplayedProvider =
    NotifierProvider<CurrentMatchupsDisplayed, List<Matchup>>(
        CurrentMatchupsDisplayed.new);

class CurrentMatchupsDisplayed extends Notifier<List<Matchup>> {
  @override
  List<Matchup> build() {
    return ref.watch(allMatchupsProvider);
  }

  void addMatchup(Matchup matchup) {
    state.add(matchup);
    ref.notifyListeners();
  }

  void removeMatchup(Matchup matchup) {
    state.remove(matchup);
    ref.notifyListeners();
  }
}
