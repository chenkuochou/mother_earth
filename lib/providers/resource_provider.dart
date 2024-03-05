import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/resource_model.dart';

final healthProvider = Provider<double>((ref) {
  return ref
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
        negative: 2,
        maxValue: 2000,
        icon: Icons.air,
        color: Colors.green,
      ),
      ChallengeModel(
        title: 'Pollution',
        negative: 1.5,
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
    List<ChallengeModel> newState = [...state];

    ChallengeModel challenge = newState[index];
    newState[index] = challenge.copyWith(positive: challenge.positive! + value);

    // print(newState[index].positive);
    // ignore: await_only_futures
    state = await newState;
    // print(state[index].positive);
  }

  Future<void> updateValue(
      {required int index, required double value}) async {
    List<ChallengeModel> newState = [...state];

    ChallengeModel challenge = newState[index];
    newState[index] = challenge.copyWith(value: value);

    // print(newState[index].value);
    // ignore: await_only_futures
    state = await newState;
    // print(state[index].value);
  }
}
