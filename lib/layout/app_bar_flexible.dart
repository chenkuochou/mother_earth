import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mother_earth/app/my_icon_value.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/providers/game_provider.dart';

class AppBarFlexible extends ConsumerWidget {
  const AppBarFlexible({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double health = ref.watch(healthProvider);
    final double healthChanges = ref.watch(healthChangesProvider);
    final double gameLevel = ref.watch(gameLevelProvider);

    Widget healthAndLevel() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myText('Health', bold: true),
                    myIconValueTrend(value: healthChanges, isForHealth: true),
                  ],
                ),
                LinearProgressIndicator(
                  value: health > 0 ? health : 0,
                  color: health > 0.75
                      ? Colors.green.shade600
                      : health > 0.5
                          ? Colors.yellow.shade600
                          : health > 0.25
                              ? Colors.orange.shade600
                              : Colors.red.shade600,
                )
              ],
            ),
            // const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myText('Level: ${gameLevel.floor()}', bold: true),
                LinearProgressIndicator(
                  value: gameLevel - gameLevel.floor(),
                  color: Colors.blue,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ],
        );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50, left: 10, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShaderMask(
              blendMode: health < 0.75 ? BlendMode.modulate : BlendMode.dstIn,
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.0,
                  colors: <Color>[
                    Colors.yellow,
                    health > 0.5
                        ? Colors.grey
                        : health > 0.25
                            ? Colors.deepOrange
                            : Colors.black
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: Lottie.asset('assets/bg/earth.json',
                  fit: BoxFit.contain, alignment: Alignment.center),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: healthAndLevel(),
            )),
          ],
        ),
      ),
    );
  }
}
