import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_text.dart';

class AppBarBottom extends ConsumerWidget {
  const AppBarBottom({super.key});

  final double iconSize = 15;

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
    return Container(
      color: Colors.grey.withOpacity(0.2),
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
              // const SizedBox(width: 5),
              singleIssue(
                  Icon(
                    Icons.school,
                    color: Colors.amber,
                    size: iconSize,
                  ),
                  11),
              // const SizedBox(width: 20),
              singleIssue(
                  Icon(
                    Icons.power,
                    color: Colors.red,
                    size: iconSize,
                  ),
                  11),
              // const SizedBox(width: 20),
              singleIssue(
                  Icon(
                    Icons.water,
                    color: Colors.blue,
                    size: iconSize,
                  ),
                  7),
              // const SizedBox(width: 20),
              singleIssue(
                  Icon(
                    Icons.landscape,
                    color: Colors.green,
                    size: iconSize,
                  ),
                  21),
              // const SizedBox(width: 5),
            ],
          ),
        ],
      ),
    );
  }
}
