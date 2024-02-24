class ProgressModel {
  final String title;
  final int duration;
  final int level;
  final double gains;
  final String assetUrl;
  final double? progressValue = 0;

  ProgressModel(
      {required this.title,
      required this.duration,
      required this.level,
      required this.gains,
      required this.assetUrl});
}

class Solution extends ProgressModel {
  final Map<Solution, int> requiredSolution;
  final Map<Development, int>? requiredDevelopment;
  final Map<Resource, double>? consumedResources;
  final Map<GlobalIssue, int> outputs;

  Solution(
      {required super.title,
      required super.duration,
      required super.level,
      required super.gains,
      required super.assetUrl,
      required this.requiredSolution,
      required this.requiredDevelopment,
      required this.consumedResources,
      required this.outputs});
}

class Development {}

class Resource {}

class GlobalIssue {}
