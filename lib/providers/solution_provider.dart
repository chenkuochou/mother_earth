import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/data/solution_date.dart';
import 'package:mother_earth/model/progress_model.dart';

final pollutionProvider =
    NotifierProvider<PollutionNotifier, List<SolutionModel>>(
        PollutionNotifier.new);

class PollutionNotifier extends Notifier<List<SolutionModel>> {
  @override
  build() => [airRenewableEnergy, airEV];

  void levelUp(int index) {
    SolutionModel solution = state[index];

    if (solution.level! + 1 < solution.maxLevel!) {
      state[index] = solution.copyWith(level: solution.level! + 1);
    } else {
      debugPrint('Maximum level reached');
    }
  }
}
