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
