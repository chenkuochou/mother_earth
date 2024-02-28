import 'package:mother_earth/model/resource_model.dart';

class ProgressModel {
  final String title;
  final Duration duration;
  final int? level;
  final double gain;
  final String assetUrl;
  final double? progress;
  // isActive

  ProgressModel({
    required this.title,
    required this.duration,
    this.level = 0,
    required this.gain,
    required this.assetUrl,
    this.progress = 0,
  });

  ProgressModel copyWith({
    String? title,
    Duration? duration,
    int? level,
    double? gain,
    String? assetUrl,
    double? progress,
  }) {
    return ProgressModel(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      gain: gain ?? this.gain,
      assetUrl: assetUrl ?? this.assetUrl,
      progress: progress ?? this.progress,
    );
  }
}

class SolutionModel extends ProgressModel {
  final Map<SolutionModel, int>? requiredSolution;
  final Map<DevelopmentModel, int>? requiredDevelopment;
  final Map<ResourceModel, double>? consumedResources;
  final Map<IssueModel, double> outputs;

  SolutionModel({
    required super.title,
    required super.duration,
    super.level,
    required super.gain,
    required super.assetUrl,
    this.requiredSolution,
    this.requiredDevelopment,
    this.consumedResources,
    required this.outputs,
    super.progress,
  });

  Duration get currentDuration => duration * (1 + gain * level!);
  double get currentOutput => outputs.values.first * (1 + gain * level!);

  @override
  SolutionModel copyWith({
    String? title,
    Duration? duration,
    int? level,
    double? gain,
    String? assetUrl,
    double? progress,
    Map<SolutionModel, int>? requiredSolution,
    Map<DevelopmentModel, int>? requiredDevelopment,
    Map<ResourceModel, double>? consumedResources,
    Map<IssueModel, double>? outputs,
  }) {
    return SolutionModel(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      gain: gain ?? this.gain,
      assetUrl: assetUrl ?? this.assetUrl,
      progress: progress ?? this.progress,
      requiredSolution: requiredSolution ?? this.requiredSolution,
      requiredDevelopment: requiredDevelopment ?? this.requiredDevelopment,
      consumedResources: consumedResources ?? this.consumedResources,
      outputs: outputs ?? this.outputs,
    );
  }
}

class DevelopmentModel {}
