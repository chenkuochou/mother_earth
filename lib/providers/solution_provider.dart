import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/listenable_item.dart';
import 'package:mother_earth/model/solution_model.dart';

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
          outputMap: {ListenableItem.challengePollution: 1},
        ),
        SolutionModel(
          title: 'Electric Cars',
          duration: const Duration(seconds: 10),
          gain: 1.5,
          assetUrl: 'airEV',
          requiredSolMap: {ListenableItem.polAirRenewable: 1},
          outputMap: {ListenableItem.challengePollution: 1.5},
        ),
        SolutionModel(
          title: 'Air Regulation',
          duration: const Duration(seconds: 30),
          gain: 2,
          assetUrl: 'airRegulation',
          requiredSolMap: {ListenableItem.polAirEV: 2},
          outputMap: {ListenableItem.challengePollution: 2},
        ),
        SolutionModel(
          title: 'Reducing use',
          duration: const Duration(seconds: 1),
          gain: 1,
          assetUrl: 'waterReduce',
          outputMap: {ListenableItem.challengePollution: 2},
        )
      ];

  Future<void> levelUp(int index) async {
    List<SolutionModel> newState = [...state];

    SolutionModel solution = newState[index];
    newState[index] = solution.copyWith(level: solution.level! + 1);

    // ignore: await_only_futures
    state = await newState;
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
