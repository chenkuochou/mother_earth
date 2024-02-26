import 'package:flutter/material.dart';
import 'package:mother_earth/page/progress/progress_bar.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class ProgressSlider extends StatelessWidget {
  const ProgressSlider({super.key, required this.list});
  final List list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 10),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: progressCard(list[index].title, index),
        );
      },
      shrinkWrap: true,
    );
  }
}

Widget progressCard(String title, int index) {
  return LayoutBuilder(builder: (_, constraints) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          SizedBox(height: constraints.maxHeight * 0.5),
          ProgressBar(index, pollutionProvider, pollutionProvider.notifier)
        ],
      ),
    );
  });
}
