import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/providers/challenge_provider.dart';

final gameTimerProvider =
    NotifierProvider<GameTimerNotifier, List<bool>>(GameTimerNotifier.new);

class GameTimerNotifier extends Notifier<List<bool>> {
  @override
  build() => List<bool>.filled(ref.read(challengeProvider).length, false,
      growable: false);
  void toggle(int index) {
    List<bool> newState = state;
    newState[index] = !newState[index];

    state = newState;
  }
}

final gameLevelProvider = Provider<double>((ref) {
  return (ref
          .watch(challengeProvider)
          .map((item) => item.level!)
          .reduce((a, b) => a + b)) /
      10;
});

final healthProvider = Provider<double>((ref) {
  return 1 -
      ref
          .watch(challengeProvider)
          .map((item) => item.value!)
          .reduce((a, b) => a + b);
});

final healthChangesProvider = Provider<double>((ref) {
  return ref
      .watch(challengeProvider)
      .map((item) => item.changes)
      .reduce((a, b) => a + b);
});

final achievementsProvider = Provider<List<bool>>((ref) {
  return [
    ref.watch(gameLevelProvider) >= 1,
    ref.watch(gameLevelProvider) >= 10,
    ref.watch(gameLevelProvider) >= 20,
    ref.watch(gameLevelProvider) >= 30,
    ref.watch(gameLevelProvider) >= 40,
    ref.watch(gameLevelProvider) >= 50,
  ];
});
