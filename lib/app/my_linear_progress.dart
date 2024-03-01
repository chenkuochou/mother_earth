import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/model/resource_model.dart';

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
  const MyLinearProgressTimer({required this.listenable, super.key});
  final ProviderListenable listenable;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyLinearProgressTimerState();
}

class _MyLinearProgressTimerState extends ConsumerState<MyLinearProgressTimer> {
// final IssueModel issue = 

  late double progress = ref.watch(widget.listenable).value;
  late double issue;
  late double solution;
  late double changes = issue + solution;

  void startTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (progress == 0) {
            // timer.cancel();
          } else {
            progress += changes;
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
