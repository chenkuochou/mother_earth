import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/page/progress/progress_card.dart';

class ProgressGroup extends ConsumerWidget {
  const ProgressGroup({
    super.key,
    required this.list,
    required this.previousItems,
    required this.toggleActive,
    required this.activations,
  });
  final List list;
  final int previousItems;
  final Function toggleActive;
  final List<bool> activations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 17),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final int longIndex = previousItems + index;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ProgressCard(
            longIndex: longIndex,
            isActive: activations[longIndex],
            toggleActive: toggleActive,
          ),
        );
      },
      shrinkWrap: true,
    );
  }
}
