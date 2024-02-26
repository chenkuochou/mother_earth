import 'package:flutter/material.dart';
import 'package:mother_earth/model/progress_model.dart';
import 'package:mother_earth/page/progress/progress_slider.dart';

class SliderContainer extends StatelessWidget {
  const SliderContainer(
      {super.key, required this.groupList, required this.constraints});

  final List<List<SolutionModel>> groupList;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: constraints.maxHeight * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: groupList.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              // width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: 20,
                    // width: 20,
                    child: Text(['Air', 'Water'][index],
                        style: const TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                      height: constraints.maxHeight * 0.25 - 50,
                      child: ProgressSlider(list: groupList[index])),
                ],
              )),
        ),
      ),
    );
  }
}
