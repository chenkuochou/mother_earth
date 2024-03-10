import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/data/all_static_data.dart';
import 'package:mother_earth/page/achievement_card.dart';
import 'package:mother_earth/providers/game_provider.dart';

class AchievementPage extends ConsumerWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: achievements.length,
          itemBuilder: (BuildContext context, int index) {
            return AchievementCard(
              achievement: achievements[index],
              isVisible: ref.watch(achievementsProvider)[index],
            );
          }),
    );
  }
}
