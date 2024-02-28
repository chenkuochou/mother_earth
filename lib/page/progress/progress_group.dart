import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/page/progress/progress_card.dart';

class ProgressGroup extends StatelessWidget {
  const ProgressGroup({
    super.key,
    required this.list,
    required this.previousItems,
    required this.listenable,
    required this.notifier,
  });
  final List list;
  final int previousItems;
  final ProviderListenable listenable;
  final ProviderListenable notifier;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 17),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ProgressCard(
              listenable: listenable,
              notifier: notifier,
              index: previousItems + index),
        );
      },
      shrinkWrap: true,
    );
  }
}
