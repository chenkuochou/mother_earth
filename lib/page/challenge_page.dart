import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/page/progress/progress_slider.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class ChallengePage extends ConsumerWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Container(
        color: const Color(0xFFE6DBCA).withOpacity(0.5),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Center(child: myText('Pollution', size: 18, bold: true)),
            ),
            ProgressSlider(
              groupList: [
                ref.read(pollutionProvider).sublist(0, 3),
                ref.read(pollutionProvider).sublist(3),
              ],
              constraints: constraints,
              listenable: pollutionProvider,
              notifier: pollutionProvider.notifier,
            ),
          ],
        ),
      ),
    );
  }
}
