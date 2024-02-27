import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class AppBarFlexible extends ConsumerWidget {
  const AppBarFlexible({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(flex: 1, child: Text('data')),
            Flexible(
              flex: 1,
              child: Lottie.network(
                  'https://lottie.host/1de15c7c-278e-4751-bd68-54ebedb5d3a3/crNVTBdG5b.json',
                  fit: BoxFit.contain,
                  alignment: Alignment.center),
            ),
            const Flexible(flex: 1, child: Text('data')),
          ],
        ),
      ),
    );
  }
}
