import 'package:flutter/material.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/page/progress/progress_group.dart';

class ProgressSlider extends StatelessWidget {
  const ProgressSlider({
    super.key,
    required this.groupList,
  });

  final List<List<SolutionModel>> groupList;

  @override
  Widget build(BuildContext context) {
    const double bgHeight = 175; //constraints.maxHeight * 0.25;
    const double groupPadding = 5;
    const double groupTitleHeight = 15;
    const double groupTitleTopPadding = 5;
    const double progressGroupHeight =
        bgHeight - groupTitleHeight - groupTitleTopPadding;

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
