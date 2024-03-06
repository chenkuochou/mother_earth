import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_linear_progress.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/model/listenable_item.dart';
import 'package:mother_earth/page/progress/progress_slider.dart';
import 'package:mother_earth/providers/inherited_providers.dart';
import 'package:mother_earth/providers/challenge_provider.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class ChallengePage extends ConsumerWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    Widget section({
      required String title,
      required ProviderListenable listenable,
      required ProviderListenable notifier,
      required List<List<int>> groupListIndex,
      required int listenableItemChallengeIndex,
    }) {
      final double changes =
          ref.watch(challengeProvider)[listenableItemChallengeIndex].changes;

      List<List> groupList(var list, List<List<int>> indexes) {
        List<List> result = [];
        for (int i = 0; i < indexes.length; i++) {
          result.add(list.sublist(
              indexes[i][0], indexes[i][1] == 0 ? null : indexes[i][1]));
        }
        return result;
      }

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myText(title, bold: true),
                    Wrap(
                      children: [
                        Icon(
                          changes > 0 ? Icons.trending_up : Icons.trending_down,
                          color: changes > 0
                              ? Colors.red.shade600
                              : Colors.green.shade600,
                          size: 17,
                        ),
                        const SizedBox(width: 2),
                        myText(
                          changes.toStringAsFixed(4),
                          bold: true,
                          color: changes > 0
                              ? Colors.red.shade600
                              : Colors.green.shade600,
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
                MyLinearProgressTimer(
                    listenable: challengeProvider,
                    notifier: challengeProvider.notifier,
                    index: listenableItemChallengeIndex),
              ],
            ),
          ),
          InheritedProviders(
            listenable: listenable,
            notifier: notifier,
            child: ProgressSlider(
              groupList: groupList(ref.read(listenable), groupListIndex),
            ),
          ),
        ],
      );
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Container(
        color: const Color(0xFFE6DBCA).withOpacity(0.5),
        child: ListView(
          children: [
            section(
                title: 'Pollution',
                listenable: pollutionProvider,
                notifier: pollutionProvider.notifier,
                groupListIndex: [
                  [0, 3],
                  [3, 0],
                ],
                listenableItemChallengeIndex:
                    ListenableItem.challengePollution.myIndex),
          ],
        ),
      ),
    );
  }
}
