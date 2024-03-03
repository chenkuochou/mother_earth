import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/listenable_item.dart';

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
  final Map<ListenableItem, int>? requiredSolMap;
  final Map<ListenableItem, int>? requiredDevMap;
  final Map<ListenableItem, double>? consumedResMap;
  final Map<ListenableItem, double> outputMap;

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

  int? get requiredSolutionIndex =>
      requiredSolMap?.keys.first.notifierIndex;
  int? get requiredSolutionLevel => requiredSolMap?.values.first;
  int? get requiredDevelopmentIndex =>
      requiredDevMap?.keys.first.notifierIndex;
  int? get requiredDevelopmentLevel => requiredDevMap?.values.first;
  int? get consumedResourcesIndex =>
      consumedResMap?.keys.first.notifierIndex;
  double? get consumedResourcesValue => consumedResMap?.values.first;

  Duration get currentDuration => duration * (1 + gain * level!);
  int get currentOutputIndex =>
      outputMap.keys.first.notifierIndex;
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
    Map<ListenableItem, int>? requiredSolMap,
    Map<ListenableItem, int>? requiredDevMap,
    Map<ListenableItem, double>? consumedResMap,
    Map<ListenableItem, double>? outputs,
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
}

class DevelopmentModel extends ProgressModel {
  final Map<ListenableItem, double>? outputs;

  DevelopmentModel({
    required super.title,
    required super.duration,
    super.level,
    required super.gain,
    required super.assetUrl,
    super.progress,
    super.isActive,
     this.outputs,
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
    Map<ListenableItem, double>? outputs,
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
