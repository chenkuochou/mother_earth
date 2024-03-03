import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/resource_model.dart';

final resourceProvider = StateProvider<List<double>>((ref) {
  return [0, 0, 0, 0, 0, 0];
});

final issueProvider = NotifierProvider<IssueProviderNotifier, List<IssueModel>>(
    IssueProviderNotifier.new);

class IssueProviderNotifier extends Notifier<List<IssueModel>> {
  @override
  build() {
    print('issueProvider');
    return [
      IssueModel(
        title: 'Climate Change',
        negative: 2,
        maxValue: 2000,
      ),
      IssueModel(
        title: 'Pollution',
        negative: 1.5,
        maxValue: 2000,
      ),
    ];
  }

  Future<void> updatePositive(double value, int index) async {
    List<IssueModel> newState = [...state];

    IssueModel issue = newState[index];
    newState[index] = issue.copyWith(positive: issue.value! + value);

    // ignore: await_only_futures
    state = await newState;
  }

  Future<void> updateLevel(int index) async {
    List<IssueModel> newState = [...state];

    IssueModel issue = newState[index];
    newState[index] = issue.copyWith(level: issue.level! + 1);

    // ignore: await_only_futures
    state = await newState;
  }
}
