import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgressBar extends ConsumerStatefulWidget {
  const ProgressBar(
    this.index,
    this.listenable,
    this.notifier, {
    Key? key,
  }) : super(key: key);
  final int index;
  final ProviderListenable listenable;
  final ProviderListenable notifier;

  @override
  ConsumerState createState() => _ProgressBarState();
}

class _ProgressBarState extends ConsumerState<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: ref.read(widget.listenable)[widget.index].currentDuration,
      lowerBound: 0,
    );
    Future(() {
      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print('producing outputs');

          ref.read(widget.notifier).levelUp(widget.index);

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

        if (isActive) {
          _animationController.forward();
        } else {
          _animationController.stop();
        }

        return GestureDetector(
          onTap: () {
            setState(() {
              isActive = !isActive;
            });
          },
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
