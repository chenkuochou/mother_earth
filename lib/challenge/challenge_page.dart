import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/progress_model.dart';
import 'package:mother_earth/progress/progress_slider.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class ChallengePage extends ConsumerWidget {
  const ChallengePage({super.key});

  Widget sliderContainer(
      List<List<Solution>> list, BoxConstraints constraints) {
    return Container(
      color: Colors.grey,
      height: constraints.maxHeight * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
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
                    child: Text(['Climate Change', 'Pollution'][index],
                        style: const TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                      height: constraints.maxHeight * 0.25 - 50,
                      child: ProgressSlider(list: list[index])),
                ],
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => ListView(
        children: [
          const Center(child: Text('Climate Change')),
          const Center(child: Text('Pollution')),
          
          sliderContainer([
            ref.read(pollutionProvider).sublist(0, 1),
            ref.read(pollutionProvider)
          ], constraints)
        ],
      ),
    );
  }
}
