import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/data/progresses.dart';
import 'package:mother_earth/model/progress_model.dart';

final pollutionProvider =
    NotifierProvider<PollutionNotifier, List<Solution>>(PollutionNotifier.new);

class PollutionNotifier extends Notifier<List<Solution>> {
  @override
  build() => [stamina, pitching, batting];

  void levelUp(int index) {
    int currentLevel = state[index].currentLevel;
    if (state[index].outputLevels.length < currentLevel) {
      state[index] = state[index].copyWith(currentLevel: currentLevel++);
    } else {
      debugPrint('Maximum level reached');
    }
  }

  void toggleActivation(String title) {
    state = [
      for (final progress in state)
        if (progress.title == title)
          progress.copyWith(isActive: !progress.isActive)
        else
          progress,
    ];
  }
}
