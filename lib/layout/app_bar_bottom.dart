import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarBottom extends ConsumerWidget {
  const AppBarBottom({super.key});

  Widget singleIssue(Icon icon, int value) => Row(
        children: [
          icon,
          const SizedBox(width: 5),
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
        ],
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // const SizedBox(width: 5),
        singleIssue(
            const Icon(
              Icons.school,
              color: Colors.amber,
            ),
            11),
        // const SizedBox(width: 20),
        singleIssue(
            const Icon(
              Icons.power,
              color: Colors.red,
            ),
            11),
        // const SizedBox(width: 20),
        singleIssue(
            const Icon(
              Icons.water,
              color: Colors.blue,
            ),
            7),
        // const SizedBox(width: 20),
        singleIssue(
            const Icon(
              Icons.landscape,
              color: Colors.green,
            ),
            21),
        // const SizedBox(width: 5),
      ],
    );
  }
}
