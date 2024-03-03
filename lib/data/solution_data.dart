import 'package:mother_earth/model/listenable_item.dart';
import 'package:mother_earth/model/solution_model.dart';

/// Pollution
final SolutionModel airRenewable = SolutionModel(
  title: 'Renewable',
  duration: const Duration(seconds: 1),
  gain: 1,
  assetUrl: 'airRenewable',
  outputMap: {ListenableItem.challengePollution: 1},
);

final SolutionModel airEV = SolutionModel(
  title: 'Electric Cars',
  duration: const Duration(seconds: 10),
  gain: 1.5,
  assetUrl: 'airEV',
  requiredSolMap: {ListenableItem.polAirRenewable: 1},
  outputMap: {ListenableItem.challengePollution: 3},
);

final SolutionModel airRegulation = SolutionModel(
  title: 'Air Regulation',
  duration: const Duration(seconds: 30),
  gain: 2,
  assetUrl: 'airRegulation',
  outputMap: {ListenableItem.challengePollution: 5},
);

final SolutionModel waterReducing = SolutionModel(
  title: 'Reducing use',
  duration: const Duration(seconds: 1),
  gain: 1,
  assetUrl: 'waterReduce',
  outputMap: {ListenableItem.challengePollution: 2},
);

/// Development
final DevelopmentModel cost = DevelopmentModel(
  title: 'Cost',
  duration: const Duration(seconds: 10),
  gain: 2,
  assetUrl: 'assetUrl',
  outputs: null,
);
