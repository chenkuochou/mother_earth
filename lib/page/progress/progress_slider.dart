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
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 17),
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
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(
        //     color: Colors.greenAccent,
        //     width: 3,
        //     strokeAlign: BorderSide.strokeAlignOutside),
      ),
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          const Expanded(child: Text('url')),
          ProgressBar(index, pollutionProvider, pollutionProvider.notifier)
        ],
      ),
    );
  });
}
