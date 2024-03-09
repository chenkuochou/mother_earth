// ignore_for_file: await_only_futures

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/data/all_static_data.dart';
import 'package:mother_earth/model/solution_model.dart';

final climateChangeProvider =
    NotifierProvider<ClimateChangeNotifier, List<SolutionModel>>(
        ClimateChangeNotifier.new);

class ClimateChangeNotifier extends Notifier<List<SolutionModel>> {
  @override
  build() => climateChangeData;

  Future<void> levelUp(int index) async {
    List<SolutionModel> newState = state;

    SolutionModel solution = newState[index];
    newState[index] = solution.copyWith(level: solution.level! + 1);

    state = await newState;
  }
}

final pollutionProvider =
    NotifierProvider<PollutionNotifier, List<SolutionModel>>(
        PollutionNotifier.new);

class PollutionNotifier extends Notifier<List<SolutionModel>> {
  @override
  build() => pollutionData;

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
    return developmentData;
  }
}

