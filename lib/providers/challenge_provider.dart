// ignore_for_file: await_only_futures

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/data/all_static_data.dart';
import 'package:mother_earth/model/challenge_model.dart';

final challengeProvider =
    NotifierProvider<ChallengeNotifier, List<ChallengeModel>>(
        ChallengeNotifier.new);

class ChallengeNotifier extends Notifier<List<ChallengeModel>> {
  @override
  build() {
    return challengeData;
  }

  Future<void> updateLevel(int index) async {
    List<ChallengeModel> newState = state;

    ChallengeModel challenge = newState[index];
    newState[index] = challenge.copyWith(level: challenge.level! + 1);

    state = await newState;
    // print(state[index].level);
  }

  Future<void> updatePositive(
      {required int index, required double value}) async {
    // print(value);
    List<ChallengeModel> newState = state;

    ChallengeModel challenge = newState[index];
    newState[index] = challenge.copyWith(positive: value);

    state = await newState;
    // print('Positive: ${state[index].positive}');
    // print('Negative: ${state[index].negative * state[index].level!}');
  }

  Future<void> updateValue({required int index, required double value}) async {
    List<ChallengeModel> newState = [...state];

    ChallengeModel challenge = newState[index];
    newState[index] = challenge.copyWith(value: value);

    // print(newState[index].value);
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
    return resourceData;
  }

  Future<void> updateValue({required int index, required double value}) async {
    List<ResourceModel> newState = [...state];

    ResourceModel resource = newState[index];
    newState[index] = resource.copyWith(value: resource.value! + value);

    state = await newState;
  }
}
