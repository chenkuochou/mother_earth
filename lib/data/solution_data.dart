import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/model/resource_model.dart';

/// Solutions
// Pollution
final SolutionModel airRenewable = SolutionModel(
  title: 'Renewable',
  duration: const Duration(seconds: 1),
  gain: 1,
  assetUrl: 'airRenewable.png',
  outputs: {
    pollution: 1,
  },
);

final SolutionModel airEV = SolutionModel(
  title: 'Electric Cars',
  duration: const Duration(seconds: 10),
  gain: 1.5,
  assetUrl: 'airEV.png',
  requiredSolution: {airRenewable: 1},
  outputs: {pollution: 1},
);

/// Global Issue
final IssueModel pollution = IssueModel(
  title: 'Pollution',
  value: 500,
);
