import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/page/progress/progress_group.dart';

class ProgressSlider extends ConsumerStatefulWidget {
  const ProgressSlider({
    super.key,
    required this.groupList,
    required this.groupTitle,
  });
  final List<List<dynamic>> groupList;
  final List<String> groupTitle;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgressSliderState();
}

class _ProgressSliderState extends ConsumerState<ProgressSlider> {
  late List<bool> activations;

  List<bool> initActivations() {
    activations = activations = List<bool>.filled(
        widget.groupList.map((e) => e.length).reduce((e1, e2) => e1 + e2),
        false,
        growable: false);

    return activations;
  }

  @override
  void initState() {
    activations = initActivations();
    super.initState();
  }

  toggleActive(int index) {
    setState(() {
      if (!activations[index]) {
        activations[index] = true;

        for (int i = 0; i < activations.length; i++) {
          if (i != index && activations[i] == true) {
            activations[i] = false;
          }
        }
      } else {
        activations[index] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const double bgHeight = 175; //constraints.maxHeight * 0.25;
    const double groupPadding = 5;
    const double groupTitleHeight = 15;
    const double groupTitleTopPadding = 3;
    const double progressGroupHeight =
        bgHeight - groupTitleHeight - groupTitleTopPadding;

    return SizedBox(
      // color: const Color(0xFFE6DBCA).withOpacity(0.5),
      height: bgHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.groupList.length,
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
                    child: Text(widget.groupTitle[index],
                        style: const TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                      height: progressGroupHeight,
                      child: ProgressGroup(
                        list: widget.groupList[index],
                        previousItems: countPreviousItems(index),
                        toggleActive: toggleActive,
                        activations: activations,
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
      count += widget.groupList[i].length;
    }
    return count;
  }
}
