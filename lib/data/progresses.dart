import 'package:mother_earth/model/progress_model.dart';

/// Solutions
// Pollution
final Solution airRenewableEnergy = Solution(
  title: 'Renewable Energy',
  duration: const Duration(seconds: 1),
  gains: 1,
  assetUrl: 'assetUrl',
  outputs: {
    pollution: 1,
  },
);

final Solution airEV = Solution(
  title: 'Electric Cars',
  duration: const Duration(seconds: 30),
  gains: 0.1,
  assetUrl: 'assetUrl',
  requiredSolution: {airRenewableEnergy: 1},
  outputs: {pollution: 1},
);

/// Global Issue
final GlobalIssue pollution = GlobalIssue(
  title: 'Pollution',
  duration: const Duration(seconds: 30),
  gains: 0,
  assetUrl: '',
);
