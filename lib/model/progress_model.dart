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

class Solution extends ProgressModel {
  final Map<Solution, int>? requiredSolution;
  final Map<Development, int>? requiredDevelopment;
  final Map<Resource, double>? consumedResources;
  final Map<GlobalIssue, double> outputs;

  Solution({
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
  Solution copyWith({
    String? title,
    Duration? duration,
    int? level,
    double? gains,
    String? assetUrl,
    double? progress,
    int? maxLevel,
    Map<Solution, int>? requiredSolution,
    Map<Development, int>? requiredDevelopment,
    Map<Resource, double>? consumedResources,
    Map<GlobalIssue, double>? outputs,
  }) {
    return Solution(
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

class Development {}

class Resource {}

class GlobalIssue extends ProgressModel {
  GlobalIssue({
    required super.title,
    required super.duration,
    required super.gains,
    required super.assetUrl,
    super.progress,
  });
  Duration get tolerance => duration;
}
