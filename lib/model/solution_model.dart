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
  // [title,level]
  final Map<String, int>? requiredSolMap;
  final Map<String, int>? requiredDevMap;
  final Map<String, double>? consumedResMap;
  final Map<String, double> outputMap;

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

  ProviderListenable? get requiredSolution =>stringToListenable(requiredSolMap?.keys.first) ;
  int? get requiredSolutionLevel => requiredSolMap?.values.first;
  ProviderListenable? get requiredDevelopment => requiredDevMap?.keys.first;
  int? get requiredDevelopmentLevel => requiredDevMap?.values.first;
  ProviderListenable? get consumedResources => consumedResMap?.keys.first;
  double? get consumedResourcesValue => consumedResMap?.values.first;

  Duration get currentDuration => duration * (1 + gain * level!);
  ProviderListenable get currentOutputIndex => outputMap.keys.first;
  double get currentOutputValue => outputMap.values.first * (1 + gain * level!);

  @override
  SolutionModel copyWith({
    String? title,
    Duration? duration,
    int? level,
    double? gain,
    String? assetUrl,
    double? progress,
    bool? isActive,
    Map<String, int>? requiredSolMap,
    Map<String, int>? requiredDevMap,
    Map<String, double>? consumedResMap,
    Map<String, double>? outputs,
  }) {
    return SolutionModel(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      gain: gain ?? this.gain,
      assetUrl: assetUrl ?? this.assetUrl,
      progress: progress ?? this.progress,
      isActive: isActive ?? this.isActive,
      requiredSolMap: requiredSolMap ?? requiredSolMap,
      requiredDevMap: requiredDevMap ?? requiredDevMap,
      consumedResMap: consumedResMap ?? consumedResMap,
      outputMap: outputs ?? outputMap,
    );
  }

  ProviderListenable? stringToListenable(String? string) => switch (string) {
        'requiredSolution' => requiredSolution!,
        _ => null,
      };
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
