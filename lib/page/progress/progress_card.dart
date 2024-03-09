import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_formatted_number.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/model/challenge_model.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/page/progress/progress_bar.dart';
import 'package:mother_earth/providers/game_provider.dart';
import 'package:mother_earth/providers/inherited_providers.dart';
import 'package:mother_earth/providers/challenge_provider.dart';

class ProgressCard extends ConsumerStatefulWidget {
  const ProgressCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgressCardState();
}

class _ProgressCardState extends ConsumerState<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    final ProviderListenable listenable =
        InheritedProviders.of(context).listenable;
    final SolutionModel solution = ref.read(listenable)[widget.index];

    final ProviderListenable notifier = InheritedProviders.of(context).notifier;
    final ChallengeModel challenge =
        ref.read(challengeProvider)[solution.outputIndex];
    final ResourceModel resource =
        ref.read(resourceProvider)[solution.consumedResourcesIndex ?? 0];

    final int solutionIndex = InheritedProviders.of(context).challengeIndex;
    bool isActive = ref.watch(activationProvider)[solutionIndex][widget.index];

    bool isClickable() {
      if (solution.requiredSolMap == null && solution.consumedResMap == null) {
        return true;
      }

      if (solution.requiredSolMap != null) {
        if (ref.watch(listenable)[solution.requiredSolutionIndex].level >=
            solution.requiredSolutionLevel) {
          return true;
        }
      }

      if (solution.consumedResMap != null) {
        if (ref
                .watch(resourceProvider)[solution.consumedResourcesIndex!]
                .value! >=
            solution.consumedResourcesValue!) {
          return true;
        }
      }

      return false;
    }

    Row iconValue(
            IconData icon, Color iconColor, double value, Color valueColor) =>
        Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 15,
            ),
            const SizedBox(width: 2),
            myText('-${myFormattedNumber(value)}',
                color: valueColor, size: 12, bold: true),
          ],
        );

    return GestureDetector(
      onTap: () {
        isClickable()
            ? setState(() {
                if (!isActive) {
                  ref.read(activationProvider.notifier).toggleActive(
                      solutionIndex: solutionIndex,
                      index: widget.index,
                      isActive: true);
                } else {
                  ref.read(activationProvider.notifier).toggleActive(
                      solutionIndex: solutionIndex,
                      index: widget.index,
                      isActive: false);
                }
                HapticFeedback.selectionClick();
              })
            : null;
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(10),
          border: isActive
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
                            challenge.icon,
                            challenge.color,
                            ref.watch(listenable)[widget.index].outputValue,
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
                                resource.icon,
                                Colors.grey.shade600,
                                ref
                                    .watch(listenable)[widget.index]
                                    .consumedResourcesValue,
                                Colors.grey.shade600),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              ProgressBar(
                isForSolution: true,
                listenable: listenable,
                notifier: notifier,
                index: widget.index,
                isActive: isActive,
              ),
            ],
          );
        }),
      ),
    );
  }
}
