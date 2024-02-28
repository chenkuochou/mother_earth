import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/data/solution_data.dart';
import 'package:mother_earth/model/solution_model.dart';

final pollutionProvider =
    NotifierProvider<PollutionNotifier, List<SolutionModel>>(
        PollutionNotifier.new);

class PollutionNotifier extends Notifier<List<SolutionModel>> {
  @override
  build() => [airRenewable, airEV];

  void levelUp(int index) {
    SolutionModel solution = state[index];
    state[index] = solution.copyWith(level: solution.level! + 1);
  }
}
