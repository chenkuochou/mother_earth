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
        title: 'Pollution',
        value: 250,
        maxValue: 500,
      ),
    ];
  }
}
