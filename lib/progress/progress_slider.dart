import 'package:flutter/material.dart';
import 'package:mother_earth/progress/progress_bar.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class ProgressSlider extends StatelessWidget {
  const ProgressSlider({super.key, required this.list});
  final List list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
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

Container progressCard(String title, int index) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey,
    ),
    width: 150,
    child: Column(
      children: [
        Text(title),
        ProgressBar(index, pollutionProvider, pollutionProvider.notifier)
      ],
    ),
  );
}
