import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/page/progress/progress_bar.dart';

class ProgressCard extends ConsumerWidget {
  const ProgressCard(this.listenable, this.notifier, this.index, {super.key});
  final ProviderListenable listenable;
  final ProviderListenable notifier;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (_, constraints) => Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //     color: Colors.greenAccent,
          //     width: 3,
          //     strokeAlign: BorderSide.strokeAlignOutside),
        ),
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(ref.read(listenable)[index].title),
            const Expanded(child: Text('url')),
            ProgressBar(listenable, notifier, index)
          ],
        ),
      ),
    );
  }
}
