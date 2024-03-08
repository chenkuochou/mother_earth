import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/providers/challenge_provider.dart';

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
  late Timer _timer = Timer.periodic(const Duration(seconds: 1), (_) {});
  late double progress = ref.read(widget.listenable)[widget.index].value;
  bool isTimerActive = true;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(
        () {
          progress += ref.watch(widget.listenable)[widget.index].changes;
          ref
              .read(widget.notifier)
              .updateValue(index: widget.index, value: progress);
          // debugPrint(progress.toString());
          // debugPrint(ref.read(widget.listenable)[widget.index].toString());
          if (progress > 1) {
            /// TODO: game end msg
            _timer.cancel();
          }
        },
      ),
    );
  }

  void cancelTimer() {
    _timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    startTimer();
    // });
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
          minHeight: 25,
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
              Center(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTimerActive = !isTimerActive;
                          ref.read(gameTimerProvider.notifier).toggle();
                        });
                        isTimerActive ? startTimer() : cancelTimer();
                      },
                      // isTimerActive ? cancelTimer() : startTimer(),
                      child: Icon(
                          isTimerActive ? Icons.pause : Icons.play_arrow))),
            ],
          ),
        ),
      ],
    );
  }
}
