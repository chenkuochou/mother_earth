// ignore_for_file: await_only_futures

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/listenable_item.dart';
import 'package:mother_earth/providers/challenge_provider.dart';
import 'package:mother_earth/providers/solution_provider.dart';

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

final gameLevelProvider = Provider<int>((ref) {
  return ref
      .watch(challengeProvider)
      .map((item) => item.level!)
      .reduce((a, b) => a + b);
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

final activationProvider =
    NotifierProvider<ActivationNotifier, List<List<bool>>>(
        ActivationNotifier.new);

class ActivationNotifier extends Notifier<List<List<bool>>> {
  @override
  build() {
    return [
      List<bool>.filled(ref.read(climateChangeProvider).length, false,
          growable: false),
      List<bool>.filled(ref.read(pollutionProvider).length, false,
          growable: false),
    ];
  }

  Future<void> toggleActive({
    required int solutionIndex,
    required int index,
    required bool isActive,
  }) async {
    List<List<bool>> newState = state;
    List<bool> activations = newState[solutionIndex];

    if (isActive) {
      activations[index] = true;

      for (int i = 0; i < activations.length; i++) {
        if (i != index && activations[i] == true) {
          activations[i] = false;
        }
      }
      newState[solutionIndex] = activations;
      state = await newState;
      return;
    } else {
      activations[index] = false;

      ref.read(challengeProvider.notifier).updatePositive(
          index: ListenableItem.challengePollution.myIndex, value: 0);

      state = await newState;
    }
  }
}
