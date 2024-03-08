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

final challengeProvider =
    NotifierProvider<ChallengeNotifier, List<ChallengeModel>>(
        ChallengeNotifier.new);

class ChallengeNotifier extends Notifier<List<ChallengeModel>> {
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
    // print('Positive: ${state[index].positive}');
    // print('Negative: ${state[index].negative * state[index].level!}');
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

final resourceProvider =
    NotifierProvider<ResourceNotifier, List<ResourceModel>>(
        ResourceNotifier.new);

class ResourceNotifier extends Notifier<List<ResourceModel>> {
  @override
  build() {
    return [
      ResourceModel(
        title: 'Money',
        icon: Icons.paid,
        color: Colors.amber.shade600,
      ),
      ResourceModel(
        title: 'Tech',
        icon: Icons.rocket_launch,
        color: Colors.red.shade600,
      ),
      ResourceModel(
        title: 'People',
        icon: Icons.favorite_sharp,
        color: Colors.green.shade600,
      ),
      ResourceModel(
        title: 'Industry',
        icon: Icons.apartment,
        color: Colors.blue.shade600,
      ),
      ResourceModel(
        title: 'Gift',
        icon: Icons.redeem,
        color: Colors.purple.shade600,
      ),
    ];
  }
}
