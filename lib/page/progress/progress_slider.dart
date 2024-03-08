import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/page/progress/progress_group.dart';

class ProgressSlider extends ConsumerWidget {
  const ProgressSlider({super.key,
    required this.groupList,
  });
  final List<List<dynamic>> groupList;

 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double bgHeight = 175; //constraints.maxHeight * 0.25;
    const double groupPadding = 5;
    const double groupTitleHeight = 15;
    const double groupTitleTopPadding = 3;
    const double progressGroupHeight =
        bgHeight - groupTitleHeight - groupTitleTopPadding;

    // List<bool> activations = List<bool>.filled(
    //     ref.read(InheritedProviders.of(context).listenable).length, false,
    //     growable: false);

    // void toggleActivation(bool isActive, int index) {
    //   setState(() {
    //     if (!isActive) {
    //       // ref.read(activationProvider.notifier).toggleActive(
    //       //     solutionIndex: solutionIndex,
    //       //     index: widget.index,
    //       //     isActive: true);
    //       // isActive = !isActive;
    //       activations[index] = true;
    //       for (int i = 0; i < activations.length; i++) {
    //         if (i != index && activations[i] == true) {
    //           activations[i] = false;
    //         }
    //       }
    //       print(activations.toString());
    //     } else {
    //       // ref.read(activationProvider.notifier).toggleActive(
    //       //     solutionIndex: solutionIndex,
    //       //     index: widget.index,
    //       //     isActive: false);
    //       activations[index] = false;

    //       ref.read(challengeProvider.notifier).updatePositive(
    //           index: ListenableItem.challengePollution.myIndex, value: 0);
    //       print('false');
    //     }
    //   });
    //   HapticFeedback.selectionClick();
    // }

    return SizedBox(
      // color: const Color(0xFFE6DBCA).withOpacity(0.5),
      height: bgHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: groupList.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: groupPadding),
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
                      height: progressGroupHeight,
                      child: ProgressGroup(
                        list: groupList[index],
                        previousItems: countPreviousItems(index),
                        // toggleActivation: toggleActivation,
                        // activation: activations,
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
