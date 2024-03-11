import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/common/my_text.dart';
import 'package:mother_earth/model/challenge_model.dart';
import 'package:mother_earth/providers/challenge_provider.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class AppBarBottom extends ConsumerWidget {
  const AppBarBottom({super.key});

  final double iconSize = 15;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ResourceModel> resources = ref.watch(resourceProvider);

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myText('Subtle shifts emerge: ', bold: true),
                      myText('Early signs of pollution'),
                    ],
                  ),
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
