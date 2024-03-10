import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_formatted_number.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/model/challenge_model.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/page/progress/progress_bar.dart';
import 'package:mother_earth/providers/challenge_provider.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class DevelopmentCard extends ConsumerStatefulWidget {
  const DevelopmentCard(
      {super.key, required this.index, required this.isActive});
  final int index;
  final bool isActive;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DevelopmentCardState();
}

class _DevelopmentCardState extends ConsumerState<DevelopmentCard> {
  late DevelopmentModel development;
  late ResourceModel resource;

  @override
  void initState() {
    super.initState();
    development = ref.read(developmentProvider)[widget.index];
    resource = ref.read(resourceProvider)[development.outputIndex];
  }

  bool isClickable() {
    if (development.requiredDevMap == null) {
      return true;
    }

    if (development.requiredDevMap != null) {
      if (ref
              .watch(developmentProvider)[development.requiredDevelopmentIndex!]
              .level! >=
          development.requiredDevelopmentLevel!) {
        return true;
      }
    }

    return false;
  }

  Row iconValue(
          {required IconData icon,
          required Color iconColor,
          required double value,
          required Color valueColor}) =>
      Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 15,
          ),
          const SizedBox(width: 2),
          myText('+${myFormattedNumber(value)}',
              color: valueColor, size: 12, bold: true),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        // color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10),
        border: widget.isActive
            ? Border.all(
                color: Colors.greenAccent,
                width: 3,
                strokeAlign: BorderSide.strokeAlignOutside)
            : null,
        image: DecorationImage(
          image: AssetImage('assets/images/${development.assetUrl}'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              AutoSizeText(
                maxFontSize: 17,
                minFontSize: 14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                development.title,
                style: TextStyle(
                    color: Colors.grey.shade300, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: iconValue(
                    icon: resource.icon,
                    iconColor: resource.color,
                    value: development.outputValue,
                    valueColor: Colors.green.shade600),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProgressBar(
              isForSolution: false,
              listenable: developmentProvider,
              notifier: developmentProvider.notifier,
              index: widget.index,
              isActive: widget.isActive,
            ),
          )
        ],
      ),
    );

    // ignore: dead_code
    Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10),
        border: widget.isActive
            ? Border.all(
                color: Colors.greenAccent,
                width: 3,
                strokeAlign: BorderSide.strokeAlignOutside)
            : null,
      ),
      child: LayoutBuilder(builder: (_, constraints) {
        return Row(
          children: [
            Flexible(
              flex: 5,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/img/${development.assetUrl}.png',
                      color: isClickable() ? null : Colors.grey.shade900,
                    ),
                  ),
                  AutoSizeText(
                    maxFontSize: 15,
                    minFontSize: 12,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    development.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProgressBar(
                    isForSolution: false,
                    listenable: developmentProvider,
                    notifier: developmentProvider.notifier,
                    index: widget.index,
                    isActive: widget.isActive,
                  ),
                )),
          ],
        );
      }),
    );
  }
}
