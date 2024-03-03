import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/data/resource_data.dart';
import 'package:mother_earth/model/resource_model.dart';

final resourceProvider = StateProvider<List<double>>((ref) {
  return [0, 0, 0, 0, 0, 0];
});

final challengeProvider =
    NotifierProvider<ChallengeProviderNotifier, List<ChallengeModel>>(
        ChallengeProviderNotifier.new);

class ChallengeProviderNotifier extends Notifier<List<ChallengeModel>> {
  @override
  build() {
    print('challengeProvider');
    return [climateChange, pollution];
  }

  Future<void> updatePositive(double value, int index) async {
    List<ChallengeModel> newState = [...state];

    ChallengeModel challenge = newState[index];
    newState[index] = challenge.copyWith(positive: challenge.value! + value);

    // ignore: await_only_futures
    state = await newState;
  }

  Future<void> updateLevel(int index) async {
    List<ChallengeModel> newState = [...state];

    ChallengeModel challenge = newState[index];
    newState[index] = challenge.copyWith(level: challenge.level! + 1);

    // ignore: await_only_futures
    state = await newState;
  }
}
