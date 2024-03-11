import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/providers/game_provider.dart';

class ProgressLinearTimer extends ConsumerStatefulWidget {
  const ProgressLinearTimer({
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

class _MyLinearProgressTimerState extends ConsumerState<ProgressLinearTimer> {
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

          // End Game
          Future(() {
            if (progress > 1) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Center(child: Text('Mother Earth Is Dead')),
                  content: const Text('Sadly you have reached the end..'),
                  backgroundColor: const Color(0xFFE6DBCA),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade800)),
                      child: myText('PLAY AGAIN'),
                    ),
                  ],
                ),
              );
              // stop all & resetStates
              _timer.cancel();
            }
          });
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
          color: progress < 0.25
              ? Colors.green.shade600
              : progress < 0.5
                  ? Colors.yellow.shade600
                  : progress < 0.75
                      ? Colors.orange.shade600
                      : Colors.red.shade600,
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
                      : '${(progress * 100).toStringAsFixed(2)}%',
                  size: 13,
                  bold: true,
                  color: Colors.black54),
              Center(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTimerActive = !isTimerActive;
                          ref
                              .read(gameTimerProvider.notifier)
                              .toggle(widget.index);
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
