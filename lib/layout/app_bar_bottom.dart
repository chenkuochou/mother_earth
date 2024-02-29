import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class AppBarBottom extends ConsumerWidget {
  const AppBarBottom({super.key});

  final double iconSize = 15;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // color: Colors.grey.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LayoutBuilder(builder: (_, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: constraints.maxWidth,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myText('Subtle shifts emerge: ', bold: true),
                      myText('Early signs of pollution'),
                    ],
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              singleIssue(
                  Icon(
                    Icons.paid,
                    color: Colors.amber,
                    size: iconSize,
                  ),
                  ref.watch(pollutionProvider)[0].level!),
              singleIssue(
                  Icon(
                    Icons.rocket,
                    color: Colors.red,
                    size: iconSize,
                  ),
                  11),
              singleIssue(
                  Icon(
                    Icons.favorite_sharp,
                    color: Colors.green,
                    size: iconSize,
                  ),
                  21),
              singleIssue(
                  Icon(
                    Icons.apartment,
                    color: Colors.blue,
                    size: iconSize,
                  ),
                  7),
              singleIssue(
                  Icon(
                    Icons.redeem,
                    color: Colors.purple,
                    size: iconSize,
                  ),
                  0),
              // singleIssue(
              //     Icon(
              //       Icons.landscape,
              //       color: Colors.grey,
              //       size: iconSize,
              //     ),
              //     7),
            ],
          ),
        ],
      ),
    );
  }

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
}
