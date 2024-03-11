import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/providers/challenge_provider.dart';
import 'package:mother_earth/providers/game_provider.dart';
import 'package:mother_earth/providers/inherited_providers.dart';

class ProgressBar extends ConsumerStatefulWidget {
  const ProgressBar({
    super.key,
    required this.isForSolution,
    required this.listenable,
    required this.notifier,
    required this.index,
    required this.isActive,
  });

  final bool isForSolution;
  final ProviderListenable listenable;
  final ProviderListenable notifier;
  final int index;
  final bool isActive;

  @override
  ConsumerState createState() => _ProgressBarState();
}

class _ProgressBarState extends ConsumerState<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late var solution = ref.read(widget.listenable)[widget.index];
  late List<bool> achievements;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      // TODO: duration add gift variation
      duration: solution.currentDuration,
      lowerBound: 0,
    );

    Future(() {
      _animationController.addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          // update solution level
          await ref.read(widget.notifier).levelUp(widget.index);

          // update challenge level
          if (widget.isForSolution) {
            await ref
                .read(challengeProvider.notifier)
                .updateLevel(solution.outputIndex);
          }

          // update challenge positive
          if (widget.isForSolution) {
            await ref.read(challengeProvider.notifier).updatePositive(
                index: solution.outputIndex,
                value: ref.read(widget.listenable)[widget.index].outputValue);
          } // update resource
          else {
            await ref.read(resourceProvider.notifier).updateValue(
                index: solution.outputIndex,
                value: ref.read(widget.listenable)[widget.index].outputValue);
          }

          // Notify achievement
          if (!listEquals(
              achievements, ref.read(achievementUnlockedProvider))) {
            setState(() {
              achievements = ref.read(achievementUnlockedProvider);
            });

            final snackBar = SnackBar(
              content: Center(
                  child: myText('New achievement unlocked!',
                      size: 17, bold: true)),
              backgroundColor: Colors.green.shade600,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 8,
              behavior: SnackBarBehavior.floating,
            );
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }

          // increase solution duration & reset animation
          _animationController.duration =
              await ref.read(widget.listenable)[widget.index].currentDuration;
          _animationController.repeat();
        }
      });
    });

    achievements = ref.read(achievementUnlockedProvider);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> whenAnimationComplete() async {}

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) {
        double value = _animationController.value;

        if (widget.isActive) {
          _animationController.forward();
          if (widget.isForSolution &&
              ref.watch(gameTimerProvider)[
                  InheritedProviders.of(context).challengeIndex]) {
            _animationController.stop();
          }
        } else {
          _animationController.stop();
        }


        return ClipRRect(
          borderRadius: widget.isForSolution
              ? const BorderRadius.vertical(bottom: Radius.circular(10))
              : const BorderRadius.all(Radius.zero),
          child: Stack(
            children: [
              LinearProgressIndicator(
                minHeight: 22,
                value: value,
                color: Colors.green,
                backgroundColor: Colors.white70,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Level ${ref.watch(widget.listenable)[widget.index].level.toString()}',
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
