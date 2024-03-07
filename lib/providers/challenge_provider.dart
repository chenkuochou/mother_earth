import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/challenge_model.dart';

final healthProvider = Provider<double>((ref) {
  return 1 -
      ref
          .watch(challengeProvider)
          .map((item) => item.value!)
          .reduce((a, b) => a + b);
});

final resourceProvider = StateProvider<List<double>>((ref) {
  return [0, 0, 0, 0, 0, 0];
});

final challengeProvider =
    NotifierProvider<ChallengeProviderNotifier, List<ChallengeModel>>(
        ChallengeProviderNotifier.new);

class ChallengeProviderNotifier extends Notifier<List<ChallengeModel>> {
  @override
  build() {
    return [
      ChallengeModel(
        title: 'Climate Change',
        negative: 0.2,
        maxValue: 2000,
        icon: Icons.air,
        color: Colors.green,
      ),
      ChallengeModel(
        title: 'Pollution',
        negative: 0.2, //1.5,
        maxValue: 2000,
        icon: Icons.factory,
        color: Colors.grey.shade600,
      )
    ];
  }

  Future<void> updateLevel(int index) async {
    List<ChallengeModel> newState = state;

    ChallengeModel challenge = newState[index];
    newState[index] = challenge.copyWith(level: challenge.level! + 1);

    // ignore: await_only_futures
    state = await newState;
    // print(state[index].level);
  }

  Future<void> updatePositive(
      {required int index, required double value}) async {
    // print(value);
    List<ChallengeModel> newState = state;

    ChallengeModel challenge = newState[index];
    newState[index] = challenge.copyWith(positive: value);

    // ignore: await_only_futures
    state = await newState;
    print('Positive: ${state[index].positive}');
    print('Negative: ${state[index].negative * state[index].level!}');
  }

  Future<void> updateValue({required int index, required double value}) async {
    List<ChallengeModel> newState = [...state];

    ChallengeModel challenge = newState[index];
    newState[index] = challenge.copyWith(value: value);

    // print(newState[index].value);
    // ignore: await_only_futures
    state = await newState;
    // print(state[index].value);
  }
}
