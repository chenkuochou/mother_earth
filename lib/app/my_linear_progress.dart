import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLinearProgress extends ConsumerWidget {
  const MyLinearProgress({
    required this.listenable,
    required this.index,
    this.minHeight,
    super.key,
  });

  final ProviderListenable listenable;
  final int index;
  final double? minHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LinearProgressIndicator(
      value: ref.watch(listenable)[index].value /
          ref.read(listenable)[index].maxValue,
      color: Colors.green,
      minHeight: minHeight,
      backgroundColor: const Color(0xFFE6DBCA).withOpacity(0.5),
    );
  }
}

class MyLinearProgressTimer extends ConsumerStatefulWidget {
  const MyLinearProgressTimer({
    required this.listenable,
    required this.index,
    super.key,
  });
  final ProviderListenable listenable;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyLinearProgressTimerState();
}

class _MyLinearProgressTimerState extends ConsumerState<MyLinearProgressTimer> {
  late double progress = ref.read(widget.listenable)[widget.index].value;

  void startTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          print(ref.watch(widget.listenable)[widget.index].changes);
          progress += ref.watch(widget.listenable)[widget.index].changes;
          if (progress == 1) {
            // game end msg
            timer.cancel();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      color: Colors.green,
      minHeight: 15,
      backgroundColor: const Color(0xFFE6DBCA).withOpacity(0.5),
    );
  }
}
