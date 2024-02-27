import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/progress_model.dart';
import 'package:mother_earth/page/progress/progress_group.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class ProgressSlider extends StatelessWidget {
  const ProgressSlider({
    super.key,
    required this.groupList,
    required this.constraints,
    required this.listenable,
    required this.notifier,
  });

  final List<List<SolutionModel>> groupList;
  final BoxConstraints constraints;
  final ProviderListenable listenable;
  final ProviderListenable notifier;

  @override
  Widget build(BuildContext context) {
    final double bgHeight = constraints.maxHeight * 0.25;
    const double groupPadding = 8;
    const double groupTitleHeight = 20;
    const double groupTitleTopPadding = 5;
    final double progressSliderHeight =
        bgHeight - groupPadding * 2 - groupTitleHeight - groupTitleTopPadding;

    return SizedBox(
      // color: const Color(0xFFE6DBCA).withOpacity(0.5),
      height: bgHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: groupList.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(groupPadding),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.black,
              ),
              // width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: groupTitleTopPadding),
                    height: groupTitleHeight,
                    // width: 20,
                    child: Text(['Air', 'Water'][index],
                        style: const TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                      height: progressSliderHeight,
                      child: ProgressGroup(
                        list: groupList[index],
                        previousItems: countPreviousItems(index),
                        listenable: listenable,
                        notifier: notifier,
                      )),
                ],
              )),
        ),
      ),
    );
  }

  int countPreviousItems(int index) {
    int count = 0;
    for (int i = 0; i < index; i++) {
      count += groupList[i].length;
    }
    return count;
  }
}
