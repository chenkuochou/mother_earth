// ignore_for_file: await_only_futures

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/listenable_item.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/providers/challenge_provider.dart';

final pollutionProvider =
    NotifierProvider<PollutionNotifier, List<SolutionModel>>(
        PollutionNotifier.new);

class PollutionNotifier extends Notifier<List<SolutionModel>> {
  @override
  build() => [
        SolutionModel(
          title: 'Renewable',
          duration: const Duration(seconds: 1),
          gain: 1,
          assetUrl: 'airRenewable',
          outputMap: {ListenableItem.challengePollution: 0.1},
        ),
        SolutionModel(
          title: 'Electric Cars',
          duration: const Duration(seconds: 5),
          gain: 1.5,
          assetUrl: 'airEV',
          requiredSolMap: {ListenableItem.polAirRenewable: 3},
          outputMap: {ListenableItem.challengePollution: 0.15},
        ),
        SolutionModel(
          title: 'Air Regulation',
          duration: const Duration(seconds: 10),
          gain: 2,
          assetUrl: 'airRegulation',
          requiredSolMap: {ListenableItem.polAirEV: 5},
          outputMap: {ListenableItem.challengePollution: 0.25},
        ),
        SolutionModel(
          title: 'Reducing use',
          duration: const Duration(seconds: 5),
          gain: 1,
          assetUrl: 'waterReduce',
          outputMap: {ListenableItem.challengePollution: 2},
        )
      ];

  Future<void> levelUp(int index) async {
    List<SolutionModel> newState = state;

    SolutionModel solution = newState[index];
    newState[index] = solution.copyWith(level: solution.level! + 1);

    state = await newState;
    // print(state[index].outputValue);
    // print(state[index].outputMap.values.first);
    // print(state[index].gain);
    // print(state[index].level);
    // print(state[index].outputMap.values.first * (1 + state[index].gain * state[index].level!));
  }

  Future<void> toggleActive(
      {required int index, required bool isActive}) async {
    List<SolutionModel> newState = state;
    SolutionModel solution = newState[index];

    if (isActive) {
      newState[index] = solution.copyWith(isActive: isActive);

      for (int i = 0; i < newState.length; i++) {
        if (i != index && newState[i].isActive == true) {
          newState[i] = newState[i].copyWith(isActive: false);
        }
      }

      state = await newState;
      return;
    } else {
      newState[index] = solution.copyWith(isActive: isActive);

      ref.read(challengeProvider.notifier).updatePositive(
          index: ListenableItem.challengePollution.myIndex, value: 0);

      state = await newState;
    }
  }
}

final developmentProvider =
    NotifierProvider<DevelopmentNotifier, List<DevelopmentModel>>(
        DevelopmentNotifier.new);

class DevelopmentNotifier extends Notifier<List<DevelopmentModel>> {
  @override
  build() {
    return [
      DevelopmentModel(
        title: 'Cost',
        duration: const Duration(seconds: 10),
        gain: 2,
        assetUrl: 'assetUrl',
        outputs: null,
      )
    ];
  }
}
