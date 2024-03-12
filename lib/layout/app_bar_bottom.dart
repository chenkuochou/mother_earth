import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/common/my_text.dart';
import 'package:mother_earth/model/challenge_model.dart';
import 'package:mother_earth/providers/challenge_provider.dart';
import 'package:mother_earth/providers/game_provider.dart';

class AppBarBottom extends ConsumerWidget {
  const AppBarBottom({super.key});

  final double iconSize = 15;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ResourceModel> resources = ref.watch(resourceProvider);

    Row wording(List<String> wordings) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myText('${wordings[0]}: ', bold: true),
            myText(wordings[1]),
          ],
        );

    return Container(
      // color: Colors.grey.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LayoutBuilder(builder: (_, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: constraints.maxWidth,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: switch (ref.watch(healthProvider)) {
                    < 0.9 => wording(
                        ['Subtle shifts emerge', 'Early signs of pollution']),
                    < 0.8 => wording([
                        "Planet's health dips",
                        'Decline in environmental health'
                      ]),
                    < 0.7 => wording([
                        "Earth feels the strain",
                        "Planet struggles to cope with pollution"
                      ]),
                    < 0.6 => wording([
                        "Imbalance on the rise",
                        "Ecological balance disrupts"
                      ]),
                    < 0.5 => wording([
                        "Earth choked by waste",
                        "Pollution severely burdens the planet"
                      ]),
                    < 0.4 => wording(
                        ["Planet in critical state", "Urgent action needed"]),
                    < 0.3 => wording([
                        "Eco-crisis at tipping point",
                        "Near point of no return"
                      ]),
                    < 0.2 => wording([
                        "Earth teeters on brink",
                        "Imminent catastrophe looms"
                      ]),
                    _ => wording(['Healthy', 'The earth is in good condition']),
                  },
                ),
              ),
            );
          }),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var resource in resources)
                singleResource(
                    Icon(
                      resource.icon,
                      color: resource.color,
                      size: iconSize,
                    ),
                    resource.value ?? 0),
            ],
          ),
        ],
      ),
    );
  }

  Widget singleResource(Icon icon, double value) => Row(
        children: [
          icon,
          const SizedBox(width: 5),
          Text(
            value.toInt().toString(),
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
        ],
      );
}
