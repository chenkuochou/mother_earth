import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/common/my_icon_value.dart';
import 'package:mother_earth/page/progress/progress_linear_timer.dart';
import 'package:mother_earth/common/my_text.dart';
import 'package:mother_earth/model/listenable_item.dart';
import 'package:mother_earth/page/progress/progress_slider.dart';
import 'package:mother_earth/providers/game_provider.dart';
import 'package:mother_earth/providers/inherited_providers.dart';
import 'package:mother_earth/providers/challenge_provider.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class SolutionPage extends ConsumerWidget {
  const SolutionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<List<bool>>(achievementUnlockedProvider,
        (List<bool>? previousState, List<bool> newState) {
      if (!listEquals(previousState, newState)) {
        final snackBar = SnackBar(
          content: Center(
              child: myText('New achievement unlocked!',
                  color: Colors.black54, size: 17, bold: true)),
          backgroundColor: const Color(0xFFE6DBCA),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 8,
          behavior: SnackBarBehavior.floating,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    Widget section({
      required String title,
      required ProviderListenable listenable,
      required ProviderListenable notifier,
      required Map<List<String>, List<List<int>>> groupList,
      required int challengeIndex,
    }) {
      final double changes =
          ref.watch(challengeProvider)[challengeIndex].changes;
      final List<String> groupTitle = groupList.keys.first;
      final List<List<int>> groupListIndex = groupList.values.first;

      List<List> getGroupList(var list, List<List<int>> indexes) {
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
                    myIconValueTrend(
                        value: changes, decimals: 3, isForHealth: false),
                  ],
                ),
                ProgressLinearTimer(
                    listenable: challengeProvider,
                    notifier: challengeProvider.notifier,
                    index: challengeIndex),
              ],
            ),
          ),
          InheritedProviders(
            listenable: listenable,
            notifier: notifier,
            challengeIndex: challengeIndex,
            child: ProgressSlider(
              groupList: getGroupList(ref.read(listenable), groupListIndex),
              groupTitle: groupTitle,
            ),
          ),
        ],
      );
    }

    return Container(
      color: const Color(0xFFE6DBCA).withOpacity(0.5),
      child: ListView(
        children: [
          section(
            title: 'Climate Change',
            listenable: climateChangeProvider,
            notifier: climateChangeProvider.notifier,
            groupList: {
              ['Mitigation', 'Action']: [
                [0, 3],
                [3, 0]
              ]
            },
            challengeIndex: ListenableItem.challengeClimateChange.myIndex,
          ),
          section(
            title: 'Pollution',
            listenable: pollutionProvider,
            notifier: pollutionProvider.notifier,
            groupList: {
              ['Air', 'Water', 'Soil']: [
                [0, 3],
                [3, 6],
                [6, 0]
              ]
            },
            challengeIndex: ListenableItem.challengePollution.myIndex,
          ),
          section(
            title: 'Biodiversity',
            listenable: biodiversityProvider,
            notifier: biodiversityProvider.notifier,
            groupList: {
              ['Protection & Restoration', 'Education']: [
                [0, 3],
                [3, 0]
              ]
            },
            challengeIndex: ListenableItem.challengeBiodiversity.myIndex,
          ),
        ],
      ),
    );
  }
}
