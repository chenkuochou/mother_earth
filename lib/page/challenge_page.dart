import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/model/progress_model.dart';
import 'package:mother_earth/page/progress/progress_slider.dart';
import 'package:mother_earth/page/progress/slider_container.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class ChallengePage extends ConsumerWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => ListView(
        children: [
          const Center(child: Text('Climate Change')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: myText('Pollution', size: 18, isBold: true)),
          ),
          SliderContainer(
            groupList: [
              ref.read(pollutionProvider).sublist(0, 1),
              ref.read(pollutionProvider)
            ],
            constraints: constraints,
          ),
        ],
      ),
    );
  }
}
