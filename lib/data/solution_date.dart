import 'package:mother_earth/model/progress_model.dart';

/// Solutions
// Pollution
final SolutionModel airRenewableEnergy = SolutionModel(
  title: 'Renewable Energy',
  duration: const Duration(seconds: 1),
  gains: 1,
  assetUrl: 'assetUrl',
  outputs: {
    pollution: 1,
  },
);

final SolutionModel airEV = SolutionModel(
  title: 'Electric Cars',
  duration: const Duration(seconds: 10),
  gains: 1.5,
  assetUrl:
      'https://dotown.maeda-design-room.net/wp-content/uploads/2022/01/vehicle_truck_02.png',
  requiredSolution: {airRenewableEnergy: 1},
  outputs: {pollution: 1},
);

/// Global Issue
final GlobalIssueModel pollution = GlobalIssueModel(
  title: 'Pollution',
  tolerance: 500,
  duration: Duration.zero,
  gains: 0,
  assetUrl: '',
);
