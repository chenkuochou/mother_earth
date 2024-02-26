class ProgressModel {
  final String title;
  final Duration duration;
  final int? level;
  final double gains;
  final String assetUrl;
  final double? progress;
  final int? maxLevel;

  ProgressModel({
    required this.title,
    required this.duration,
    this.level = 0,
    required this.gains,
    required this.assetUrl,
    this.progress = 0,
    this.maxLevel = 999,
  });

  ProgressModel copyWith({
    String? title,
    Duration? duration,
    int? level,
    double? gains,
    String? assetUrl,
    double? progress,
    int? maxLevel,
  }) {
    return ProgressModel(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      gains: gains ?? this.gains,
      assetUrl: assetUrl ?? this.assetUrl,
      progress: progress ?? this.progress,
      maxLevel: maxLevel ?? this.maxLevel,
    );
  }
}

class SolutionModel extends ProgressModel {
  final Map<SolutionModel, int>? requiredSolution;
  final Map<DevelopmentModel, int>? requiredDevelopment;
  final Map<ResourceModel, double>? consumedResources;
  final Map<GlobalIssueModel, double> outputs;

  SolutionModel({
    required super.title,
    required super.duration,
    super.level,
    required super.gains,
    required super.assetUrl,
    this.requiredSolution,
    this.requiredDevelopment,
    this.consumedResources,
    required this.outputs,
    super.progress,
    super.maxLevel,
  });

  Duration get currentDuration => duration * (1 + gains * level!);
  Duration get currentOutput => duration * (1 + gains * level!);

  @override
  SolutionModel copyWith({
    String? title,
    Duration? duration,
    int? level,
    double? gains,
    String? assetUrl,
    double? progress,
    int? maxLevel,
    Map<SolutionModel, int>? requiredSolution,
    Map<DevelopmentModel, int>? requiredDevelopment,
    Map<ResourceModel, double>? consumedResources,
    Map<GlobalIssueModel, double>? outputs,
  }) {
    return SolutionModel(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      gains: gains ?? this.gains,
      assetUrl: assetUrl ?? this.assetUrl,
      progress: progress ?? this.progress,
      maxLevel: maxLevel ?? this.maxLevel,
      requiredSolution: requiredSolution ?? this.requiredSolution,
      requiredDevelopment: requiredDevelopment ?? this.requiredDevelopment,
      consumedResources: consumedResources ?? this.consumedResources,
      outputs: outputs ?? this.outputs,
    );
  }
}

class DevelopmentModel {}

class ResourceModel {}

class GlobalIssueModel extends ProgressModel {
  final int tolerance;

  GlobalIssueModel({
    required this.tolerance,
    required super.title,
    required super.duration,
    required super.gains,
    required super.assetUrl,
    super.progress,
  });
}
