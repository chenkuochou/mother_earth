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
          assetUrl: 'airRenewable',
          outputMap: {ListenableItem.challengePollution: 0.1},
        ),
        SolutionModel(
          title: 'Electric Cars',
          duration: const Duration(seconds: 5),
          assetUrl: 'airEV',
          requiredSolMap: {ListenableItem.polAirRenewable: 3},
          outputMap: {ListenableItem.challengePollution: 0.15},
        ),
        SolutionModel(
          title: 'Air Regulation',
          duration: const Duration(seconds: 10),
          assetUrl: 'airRegulation',
          requiredSolMap: {ListenableItem.polAirEV: 5},
          consumedResMap: {ListenableItem.resPeople: 10},
          outputMap: {ListenableItem.challengePollution: 0.25},
        ),
        SolutionModel(
          title: 'Reducing use',
          duration: const Duration(seconds: 1),
          assetUrl: 'waterReduce',
          requiredSolMap: {ListenableItem.polAirRegulation: 1},
          outputMap: {ListenableItem.challengePollution: 0.13},
        )
      ];

  Future<void> levelUp(int index) async {
    List<SolutionModel> newState = state;

    SolutionModel solution = newState[index];
    newState[index] = solution.copyWith(level: solution.level! + 1);

    state = await newState;
    // print(state[index].outputValue);
    // print(state[index].outputMap.values.first);
    // print(state[index].level);
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
        title: 'Education',
        duration: const Duration(seconds: 5),
        assetUrl: 'assetUrl',
        outputMap: {ListenableItem.resTech: 3},
      )
    ];
  }
}

final activationProvider =
    NotifierProvider<ActivationNotifier, List<List<bool>>>(
        ActivationNotifier.new);

class ActivationNotifier extends Notifier<List<List<bool>>> {
  @override
  build() {
    return [
      [],
      // List<bool>.filled(ref.read(climateProvider).length, false,
      //     growable: false),
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
