import 'package:mother_earth/model/listenable_item.dart';

class ProgressModel {
  final String title;
  final Duration duration;
  int? level;
  final Map<ListenableItem, double> outputMap;
  final String assetUrl;
  double? progress;
  bool? isActive;

  ProgressModel({
    required this.title,
    required this.duration,
    this.level = 0,
    required this.outputMap,
    required this.assetUrl,
    this.progress = 0,
    this.isActive = false,
  });

  ProgressModel copyWith({
    String? title,
    Duration? duration,
    int? level,
    String? assetUrl,
    double? progress,
    bool? isActive,
  }) {
    return ProgressModel(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      outputMap: outputMap,
      assetUrl: assetUrl ?? this.assetUrl,
      progress: progress ?? this.progress,
      isActive: isActive ?? this.isActive,
    );
  }
}

class SolutionModel extends ProgressModel {
  final Map<ListenableItem, int>? requiredSolMap;
  final Map<ListenableItem, int>? requiredDevMap;
  final Map<ListenableItem, double>? consumedResMap;

  SolutionModel({
    required super.title,
    required super.duration,
    super.level,
    required super.outputMap,
    required super.assetUrl,
    super.progress,
    super.isActive,
    this.requiredSolMap,
    this.requiredDevMap,
    this.consumedResMap,
  });

  int? get requiredSolutionIndex => requiredSolMap?.keys.first.myIndex;
  int? get requiredSolutionLevel => requiredSolMap?.values.first;

  int? get requiredDevelopmentIndex => requiredDevMap?.keys.first.myIndex;
  int? get requiredDevelopmentLevel => requiredDevMap?.values.first;

  int? get consumedResourcesIndex => consumedResMap?.keys.first.myIndex;
  double? get consumedResourcesValue => consumedResMap?.values.first;

  int get outputIndex => outputMap.keys.first.myIndex;
  double get outputValue => outputMap.values.first * (1 + level!);

  Duration get currentDuration => duration * (1 + level!);

  @override
  SolutionModel copyWith({
    String? title,
    Duration? duration,
    int? level,
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
  DevelopmentModel({
    required super.title,
    required super.duration,
    super.level,
    required super.assetUrl,
    super.progress,
    super.isActive,
    required super.outputMap,
  });

  Duration get currentDuration => duration * (1 + level!);
  int get outputIndex => outputMap.keys.first.myIndex;
  double get outputValue => outputMap.values.first * (1 + level!);

  @override
  DevelopmentModel copyWith({
    String? title,
    Duration? duration,
    int? level,
    String? assetUrl,
    double? progress,
    bool? isActive,
    Map<ListenableItem, double>? outputMap,
  }) {
    return DevelopmentModel(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      assetUrl: assetUrl ?? this.assetUrl,
      progress: progress ?? this.progress,
      isActive: isActive ?? this.isActive,
      outputMap: outputMap ?? this.outputMap,
    );
  }
}
