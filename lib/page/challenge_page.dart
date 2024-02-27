import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/page/progress/slider_container.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class ChallengePage extends ConsumerWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Container(
        color: Colors.grey[300],
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(child: myText('Pollution', size: 18, bold: true)),
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
      ),
    );
  }
}
