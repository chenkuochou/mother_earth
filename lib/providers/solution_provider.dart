import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/providers/resource_provider.dart';

final pollutionProvider =
    NotifierProvider<PollutionNotifier, List<SolutionModel>>(
        PollutionNotifier.new);

class PollutionNotifier extends Notifier<List<SolutionModel>> {
  @override
  build() => [_airRenewable, airEV, airRegulation, waterReducing];

  Future<void> levelUp(int index) async {
    List<SolutionModel> newState = [...state];

    SolutionModel solution = newState[index];
    newState[index] = solution.copyWith(level: solution.level! + 1);

    // ignore: await_only_futures
    state = await newState;
  }
}

/// Pollution
final SolutionModel _airRenewable = SolutionModel(
  title: 'Renewable',
  duration: const Duration(seconds: 1),
  gain: 1,
  assetUrl: 'airRenewable',
  outputMap: {
    issueProvider: [1, 1]
  },
);

final SolutionModel airEV = SolutionModel(
  title: 'Electric Cars',
  duration: const Duration(seconds: 10),
  gain: 1.5,
  assetUrl: 'airEV',
  requiredSolMap: {
    pollutionProvider: [0, 1]
  }, // {provider:[index,level]}
  outputMap: {
    issueProvider: [1, 3]
  },
);

final SolutionModel airRegulation = SolutionModel(
  title: 'Air Regulation',
  duration: const Duration(seconds: 30),
  gain: 2,
  assetUrl: 'airRegulation',
  outputMap: {
    issueProvider: [1, 5]
  },
);

final SolutionModel waterReducing = SolutionModel(
  title: 'Reducing use',
  duration: const Duration(seconds: 1),
  gain: 1,
  assetUrl: 'waterReduce',
  outputMap: {
    issueProvider: [1, 1]
  },
);
