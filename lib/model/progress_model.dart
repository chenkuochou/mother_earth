class Progress {
  Progress({
    required this.title,
    required this.duration,
    this.progress,
    required this.bgPath,
    required this.potentialUsed,
    required this.outputLevels,
    required this.levelExp,
    required this.levelGolds,
    required this.currentLevel,
    this.isActive = false,
  });

  final String title;
  final int duration;
  final double? progress;
  final String bgPath;
  final int potentialUsed;
  final List<int> outputLevels;
  final List<int> levelExp;
  final List<int> levelGolds;
  final int currentLevel;
  final bool isActive;

  Progress copyWith({
    String? title,
    int? duration,
    double? progress,
    String? bgPath,
    int? potentialUsed,
    List<int>? outputLevels,
    List<int>? levelExp,
    List<int>? levelGolds,
    int? currentLevel,
    bool? isActive,
  }) {
    return Progress(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      progress: progress ?? this.progress,
      bgPath: bgPath ?? this.bgPath,
      potentialUsed: potentialUsed ?? this.potentialUsed,
      outputLevels: outputLevels ?? this.outputLevels,
      levelExp: levelExp ?? this.levelExp,
      levelGolds: levelGolds ?? this.levelGolds,
      currentLevel: currentLevel ?? this.currentLevel,
      isActive: isActive ?? this.isActive,
    );
  }
}
