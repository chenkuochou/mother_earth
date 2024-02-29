import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/model/resource_model.dart';
import 'package:mother_earth/providers/solution_provider.dart';

/// Solutions
// Pollution
final SolutionModel airRenewable = SolutionModel(
  title: 'Renewable',
  duration: const Duration(seconds: 1),
  gain: 1,
  assetUrl: 'airRenewable',
  outputs: {pollution: 1},
);

final SolutionModel airEV = SolutionModel(
  title: 'Electric Cars',
  duration: const Duration(seconds: 10),
  gain: 1.5,
  assetUrl: 'airEV',
  requiredSolution: {pollutionProvider: 1},
  outputs: {pollution: 3},
);

final SolutionModel airRegulation = SolutionModel(
  title: 'Air Regulation',
  duration: const Duration(seconds: 30),
  gain: 2,
  assetUrl: 'airRegulation',
  outputs: {pollution: 3},
);

final SolutionModel waterReducing = SolutionModel(
  title: 'Reducing use',
  duration: const Duration(seconds: 1),
  gain: 1,
  assetUrl: 'waterReduce',
  outputs: {pollution: 1},
);

/// Global Issue
final IssueModel pollution = IssueModel(
  title: 'Pollution',
  value: 500,
);
