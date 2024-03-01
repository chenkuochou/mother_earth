import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgressModel {
  final String title;
  final Duration duration;
  final int? level;
  final double gain;
  final String assetUrl;
  double? progress;
  bool? isActive;

  ProgressModel({
    required this.title,
    required this.duration,
    this.level = 0,
    required this.gain,
    required this.assetUrl,
    double? progress,
    this.isActive = false,
  });

  ProgressModel copyWith({
    String? title,
    Duration? duration,
    int? level,
    double? gain,
    String? assetUrl,
    double? progress,
    bool? isActive,
  }) {
    return ProgressModel(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      gain: gain ?? this.gain,
      assetUrl: assetUrl ?? this.assetUrl,
      progress: progress ?? this.progress,
      isActive: isActive ?? this.isActive,
    );
  }
}

class SolutionModel extends ProgressModel {
  final Map<ProviderListenable, List<int>>?
      requiredSolMap; //{provider:[index,level]}
  final Map<ProviderListenable, List<int>>? requiredDevMap;
  final Map<ProviderListenable, List<double>>?
      consumedResMap; //{provider:[index,value]}
  final Map<ProviderListenable, List<double>> outputMap;

  SolutionModel({
    required super.title,
    required super.duration,
    super.level,
    required super.gain,
    required super.assetUrl,
    super.progress,
    super.isActive,
    this.requiredSolMap,
    this.requiredDevMap,
    this.consumedResMap,
    required this.outputMap,
  });

  ProviderListenable? get requiredSolution => requiredSolMap?.keys.first;
  int? get requiredSolutionIndex => requiredSolMap?.values.first[0];
  int? get requiredSolutionLevel => requiredSolMap?.values.first[1];
  ProviderListenable? get requiredDevelopment => requiredDevMap?.keys.first;
  int? get requiredDevelopmentIndex => requiredDevMap?.values.first[0];
  int? get requiredDevelopmentLevel => requiredDevMap?.values.first[1];
  ProviderListenable get output => outputMap.keys.first;
  double? get consumedResourcesIndex => consumedResMap?.values.first[0];
  double? get consumedResourcesLevel => consumedResMap?.values.first[1];

  Duration get currentDuration => duration * (1 + gain * level!);
  double get currentOutputIndex => outputMap.values.first[0];
  double get currentOutputValue =>
      outputMap.values.first[1] * (1 + gain * level!);

  @override
  SolutionModel copyWith({
    String? title,
    Duration? duration,
    int? level,
    double? gain,
    String? assetUrl,
    double? progress,
    bool? isActive,
    Map<ProviderListenable, List<int>>? requiredSolution,
    Map<ProviderListenable, List<int>>? requiredDevelopment,
    Map<ProviderListenable, List<double>>? consumedResources,
    Map<ProviderListenable, List<double>>? outputs,
  }) {
    return SolutionModel(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      gain: gain ?? this.gain,
      assetUrl: assetUrl ?? this.assetUrl,
      progress: progress ?? this.progress,
      isActive: isActive ?? this.isActive,
      requiredSolMap: requiredSolution ?? requiredSolMap,
      requiredDevMap: requiredDevelopment ?? requiredDevMap,
      consumedResMap: consumedResources ?? consumedResMap,
      outputMap: outputs ?? outputMap,
    );
  }
}

class DevelopmentModel extends ProgressModel {
  final Map<ProviderListenable, double> outputs;

  DevelopmentModel({
    required super.title,
    required super.duration,
    super.level,
    required super.gain,
    required super.assetUrl,
    super.progress,
    super.isActive,
    required this.outputs,
  });

  @override
  DevelopmentModel copyWith({
    String? title,
    Duration? duration,
    int? level,
    double? gain,
    String? assetUrl,
    double? progress,
    bool? isActive,
    Map<ProviderListenable, double>? outputs,
  }) {
    return DevelopmentModel(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      gain: gain ?? this.gain,
      assetUrl: assetUrl ?? this.assetUrl,
      progress: progress ?? this.progress,
      isActive: isActive ?? this.isActive,
      outputs: outputs ?? this.outputs,
    );
  }
}
