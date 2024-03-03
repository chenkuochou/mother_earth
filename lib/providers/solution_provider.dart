import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/providers/resource_provider.dart';

final pollutionProvider =
    NotifierProvider<PollutionNotifier, List<SolutionModel>>(
        PollutionNotifier.new);

class PollutionNotifier extends Notifier<List<SolutionModel>> {
  @override
  build() => [airRenewable, airEV, airRegulation, waterReducing];

  Future<void> levelUp(int index) async {
    List<SolutionModel> newState = [...state];

    SolutionModel solution = newState[index];
    newState[index] = solution.copyWith(level: solution.level! + 1);

    // ignore: await_only_futures
    state = await newState;
  }
}

