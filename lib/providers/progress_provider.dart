import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/data/progresses.dart';
import 'package:mother_earth/model/progress_model.dart';

final progressProvider =
    NotifierProvider<ProgressNotifier, Map<String, List<Progress>>>(
        ProgressNotifier.new);

class ProgressNotifier extends Notifier<Map<String, List<Progress>>> {
  @override
  build() {
    return {
      'A': [stamina, pitching, batting]
    };
  }

  void levelUp(String chapter, int index) {
    int currentLevel = state[chapter]![index].currentLevel;
    if (state[chapter]![index].outputLevels.length < currentLevel) {
      state[chapter]![index] =
          state[chapter]![index].copyWith(currentLevel: currentLevel++);
    } else {
      debugPrint('Maximum level reached');
    }
  }

  void activateTraining(String chapter, String title) {
    // state = [
    //   for (final training in state)
    //     if (training.title == title)
    //       training.copyWith(isActive: true)
    //     else
    //       training,
    // ];
    Map<String, List<Progress>> e = state;
    // for (var element in state[chapter]!) {
    //   print(element.title);
    //   print(element.isActive);
    // }

//  state =   
  state.update(
        chapter,
        (value) => value = [
              for (final training in value)
                if (training.title == title)
                  training.copyWith(isActive: true)
                else
                  training,
            ]);
  }

  void deactivateTraining(String chapter, String title) {
    state.update(
        chapter,
        (value) => value = [
              for (final training in value)
                if (training.title == title)
                  training.copyWith(isActive: true)
                else
                  training,
            ]);
  }
}
