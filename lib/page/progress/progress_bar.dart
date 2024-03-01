import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/solution_model.dart';

class ProgressBar extends ConsumerStatefulWidget {
  const ProgressBar({
    super.key,
    required this.listenable,
    required this.notifier,
    required this.index,
    required this.isActive,
  });

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
  late SolutionModel solution = ref.read(widget.listenable)[widget.index];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      // duration * gift updates
      duration: solution.currentDuration,
      lowerBound: 0,
    );
    Future(() {
      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          ref.read(widget.notifier).levelUp(widget.index);
          ref.read(solution.output);

          _animationController.duration =
              ref.read(widget.listenable)[widget.index].currentDuration;
          _animationController.repeat();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) {
        double value = _animationController.value;

        if (widget.isActive) {
          _animationController.forward();
        } else {
          _animationController.stop();
        }

        return ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(10)),
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
                      'Level: ${ref.watch(widget.listenable)[widget.index].level.toString()}',
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
