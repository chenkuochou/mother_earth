import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/common/my_formatted_number.dart';
import 'package:mother_earth/common/my_text.dart';
import 'package:mother_earth/model/challenge_model.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/page/progress/progress_bar.dart';
import 'package:mother_earth/providers/inherited_providers.dart';
import 'package:mother_earth/providers/challenge_provider.dart';

class ProgressCard extends ConsumerStatefulWidget {
  const ProgressCard({
    super.key,
    required this.longIndex,
    required this.isActive,
    required this.toggleActive,
  });
  final int longIndex;
  final bool isActive;
  final Function toggleActive;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgressCardState();
}

class _ProgressCardState extends ConsumerState<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    final ProviderListenable listenable =
        InheritedProviders.of(context).listenable;
    final SolutionModel solution = ref.read(listenable)[widget.longIndex];

    final ProviderListenable notifier = InheritedProviders.of(context).notifier;
    final ChallengeModel challenge =
        ref.read(challengeProvider)[solution.outputIndex];
    final ResourceModel resource =
        ref.read(resourceProvider)[solution.consumedResourcesIndex];

    bool isClickable() {
      if (solution.requiredSolMap == null &&
          solution.consumedResourcesValue == 0) {
        return true;
      }

      if (solution.requiredSolMap != null) {
        if (ref.watch(listenable)[solution.requiredSolutionIndex].level >=
            solution.requiredSolutionLevel) {
          return true;
        }
      }

      // if (solution.consumedResMap != null) {
      if (solution.consumedResourcesValue != 0 &&
          ref.watch(resourceProvider)[solution.consumedResourcesIndex].value! >=
              solution.consumedResourcesValue) {
        return true;
      }
      // }
      return false;
    }

    Row iconValue(bool isForChallenge, IconData icon, Color iconColor,
            double value, Color valueColor,
            [double? resourceRequiredValue]) =>
        Row(
          children: [
            isForChallenge
                ? const SizedBox.shrink()
                : Icon(
                    icon,
                    color: iconColor,
                    size: 15,
                  ),
            const SizedBox(width: 2),
            isForChallenge
                ? myText('-${myFormattedNumber(value)}',
                    color: valueColor, size: 12, bold: true)
                : myText(
                    '${myFormattedNumber(value)}/${myFormattedNumber(resourceRequiredValue!)}',
                    color: valueColor,
                    size: 12,
                    bold: true),
          ],
        );

    return GestureDetector(
      onTap: () {
        if (widget.isActive == false) {
          isClickable()
              ? {
                  widget.toggleActive(widget.longIndex),
                  if (solution.consumedResourcesValue != 0)
                    {
                      ref.read(resourceProvider.notifier).updateValue(
                          index: solution.consumedResourcesIndex,
                          value: -solution.consumedResourcesValue),
                    },
                }
              : null;
        } else {
          widget.toggleActive(widget.longIndex);
        }
        HapticFeedback.selectionClick();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(10),
          border: widget.isActive
              ? Border.all(
                  color: Colors.greenAccent,
                  width: 3,
                  strokeAlign: BorderSide.strokeAlignOutside)
              : null,
        ),
        width: 100,
        child: LayoutBuilder(builder: (_, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: AutoSizeText(
                  maxFontSize: 12,
                  minFontSize: 10,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  solution.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/img/${solution.assetUrl}.png',
                    color: isClickable() ? null : Colors.grey.shade900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isClickable()
                        ? iconValue(
                            true,
                            challenge.icon,
                            challenge.color,
                            ref.watch(listenable)[widget.longIndex].outputValue,
                            Colors.green.shade600,
                          )
                        : solution.requiredSolMap != null
                            ? SizedBox(
                                width: constraints.maxWidth - 15,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: myText(
                                    '${ref.read(listenable)[solution.requiredSolutionIndex].title} ${ref.read(listenable)[solution.requiredSolutionIndex].level}/${solution.requiredSolutionLevel}',
                                    color: Colors.grey.shade600,
                                    bold: true,
                                  ),
                                ),
                              )
                            : iconValue(
                                false,
                                resource.icon,
                                Colors.grey.shade600,
                                ref
                                    .watch(listenable)[widget.longIndex]
                                    .consumedResourcesValue,
                                Colors.grey.shade600,
                                ref
                                    .watch(resourceProvider)[
                                        solution.consumedResourcesIndex]
                                    .value,
                              ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              ProgressBar(
                isForSolution: true,
                listenable: listenable,
                notifier: notifier,
                index: widget.longIndex,
                isActive: widget.isActive,
                isForResourceConsuming: solution.consumedResourcesValue != 0,
                clickableCallback: () => {
                  widget.toggleActive(widget.longIndex),
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
