import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_text.dart';

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
    required this.notifier,
    required this.index,
    super.key,
  });
  final ProviderListenable listenable;
  final ProviderListenable notifier;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyLinearProgressTimerState();
}

class _MyLinearProgressTimerState extends ConsumerState<MyLinearProgressTimer> {
  late Timer _timer;
  late double progress = ref.read(widget.listenable)[widget.index].value;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          progress += ref.watch(widget.listenable)[widget.index].changes;
          ref
              .read(widget.notifier)
              .updateValue(index: widget.index, value: progress);
          // debugPrint(progress.toString());
          // debugPrint(ref.read(widget.listenable)[widget.index].toString());
          if (progress == 0.01) {
            /// TODO: game end msg
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
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LinearProgressIndicator(
          value: progress < 0 ? 0 : progress,
          color: Colors.green,
          minHeight: 20,
          backgroundColor: const Color(0xFFE6DBCA).withOpacity(0.5),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              myText(
                  progress < 0
                      ? '0%'
                      : '${(progress * 100).toStringAsFixed(2).toString()}%',
                  size: 13,
                  bold: true,
                  color: Colors.black54),
            ],
          ),
        ),
      ],
    );
  }
}
