import 'package:mother_earth/model/progress_model.dart';

final Progress stamina = Progress(
  title: 'Stamina',
  duration: 1,
  bgPath: 'bgPath',
  potentialUsed: 1,
  outputLevels: [2, 4, 5],
  levelExp: [30, 20, 10],
  levelGolds: [0, 5, 10],
  currentLevel: 0,
);

Progress pitching = Progress(
  title: 'Pitching',
  duration: 2,
  bgPath: 'bgPath',
  potentialUsed: 1,
  outputLevels: [2, 4, 5],
  levelExp: [30, 20, 10],
  levelGolds: [0, 5, 10],
  currentLevel: 0,
  // isActive: true,
);

Progress batting = Progress(
  title: 'Batting',
  duration: 1,
  bgPath: 'bgPath',
  potentialUsed: 1,
  outputLevels: [2, 4, 5],
  levelExp: [30, 20, 10],
  levelGolds: [0, 5, 10],
  currentLevel: 0,
);
