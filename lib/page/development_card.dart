import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/common/my_formatted_number.dart';
import 'package:mother_earth/common/my_text.dart';
import 'package:mother_earth/model/challenge_model.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/page/progress/progress_bar.dart';
import 'package:mother_earth/providers/challenge_provider.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class DevelopmentCard extends ConsumerStatefulWidget {
  const DevelopmentCard(
      {super.key,
      required this.index,
      required this.isActive,
      required this.toggleActive});
  final int index;
  final bool isActive;
  final Function(int) toggleActive;

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

  Row iconValue({
    required IconData icon,
    required Color iconColor,
    required double value,
    Color? valueColor = Colors.black54,
  }) =>
      Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 15,
          ),
          const SizedBox(width: 2),
          myText(
            '+${myFormattedNumber(value)}',
            color: valueColor,
            size: 12,
            bold: true,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isClickable() ? widget.toggleActive(widget.index) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            image: AssetImage('assets/bg/${development.assetUrl}'),
            fit: BoxFit.cover,
            colorFilter: isClickable()
                ? null
                : const ColorFilter.mode(Colors.grey, BlendMode.saturation),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isClickable()
                    ? AutoSizeText(
                        maxFontSize: 20,
                        minFontSize: 17,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        development.title,
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.bold),
                      )
                    : Row(
                        children: [
                          const Icon(Icons.lock, color: Colors.grey),
                          const SizedBox(width: 5),
                          myText(
                            '${ref.read(developmentProvider)[development.requiredDevelopmentIndex!].title} ${ref.read(developmentProvider)[development.requiredDevelopmentIndex!].level}/${development.requiredDevelopmentLevel}',
                            color: Colors.grey,
                            bold: true,
                          ),
                        ],
                      ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: iconValue(
                    icon: resource.icon,
                    iconColor:
                        widget.isActive ? resource.color : Colors.black54,
                    value: ref
                        .watch(developmentProvider)[widget.index]
                        .outputValue,
                  ),
                ),
              ],
            ),
            ProgressBar(
              isForSolution: false,
              listenable: developmentProvider,
              notifier: developmentProvider.notifier,
              index: widget.index,
              isActive: widget.isActive,
            )
          ],
        ),
      ),
    );
  }
}
