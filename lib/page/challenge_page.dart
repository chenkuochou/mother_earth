import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_linear_progress.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/page/progress/progress_slider.dart';
import 'package:mother_earth/providers/resource_provider.dart';
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
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myText('Pollution', bold: true),
                      Wrap(
                        children: [
                          const Icon(
                            Icons.trending_up,
                            color: Colors.green,
                            // size: 20,
                          ),
                          myText(
                            ' +24',
                            bold: true,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                   MyLinearProgressTimer(listenable: issueProvider,index: 1),
                ],
              ),
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
