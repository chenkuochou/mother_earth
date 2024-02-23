import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/progress_model.dart';
import 'package:mother_earth/providers/progress_provider.dart';

class ProgressBar extends ConsumerStatefulWidget {
  const ProgressBar(
    this.index,
    this.training, {
    Key? key,
  }) : super(key: key);
  final int index;
  final Progress training;

  @override
  ConsumerState createState() => _ProgressBarState();
}

class _ProgressBarState extends ConsumerState<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 2),
      lowerBound: 0,
    );
    Future(() {
      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          ref.read(progressProvider.notifier).deactivateTraining(
              'A', ref.read(progressProvider)['A']![widget.index].title);
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
    final double durationInHour = widget.training.duration.toDouble();

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) {
        double value = _animationController.value;
        final double hours = durationInHour - durationInHour * value;
        final double minutes = 60 - ((durationInHour * value * 60) % 60);
        final double seconds = 60 - ((durationInHour * value * 3600) % 60);

        double minuteLeft = (minutes == 60) ? 0 : minutes;
        double secondLeft = (seconds == 60) ? 0 : seconds;

        if (ref.watch(progressProvider)['A']![widget.index].isActive) {
          _animationController.forward();
        }

        return Stack(
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
                      // .floor().toString()
                      '${hours.truncateToDouble().toStringAsFixed(0).padLeft(2, '0')}:${minuteLeft.truncateToDouble().toStringAsFixed(0).padLeft(2, '0')}:${secondLeft.truncateToDouble().toStringAsFixed(0).padLeft(2, '0')}',
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
