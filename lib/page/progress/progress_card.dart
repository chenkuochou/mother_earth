import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_formatted_number.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/model/challenge_model.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/page/progress/progress_bar.dart';
import 'package:mother_earth/providers/inherited_providers.dart';
import 'package:mother_earth/providers/challenge_provider.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class ProgressCard extends ConsumerStatefulWidget {
  const ProgressCard({
    super.key,
    required this.index,
    // required this.toggleActivation,
    // required this.activation,
  });
  final int index;
  // final Function toggleActivation;
  // final List<bool> activation;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgressCardState();
}

class _ProgressCardState extends ConsumerState<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    // bool isActive = widget.activation[widget.index];

    final ProviderListenable listenable =
        InheritedProviders.of(context).listenable;
    final SolutionModel solution = ref.read(listenable)[widget.index];

    final ProviderListenable notifier = InheritedProviders.of(context).notifier;
    final ChallengeModel challenge =
        ref.read(challengeProvider)[solution.outputIndex];
    final int solutionIndex = InheritedProviders.of(context).solutionIndex;
    bool isActive = ref.watch(activationProvider)[solutionIndex][widget.index];

    bool isClickable() {
      if (solution.requiredSolMap == null && solution.requiredDevMap == null) {
        return true;
      }

      if (solution.requiredSolMap != null) {
        if (ref.watch(listenable)[solution.requiredSolutionIndex].level >=
            solution.requiredSolutionLevel) {
          return true;
        }
      }

      if (solution.requiredDevMap != null) {
        if (ref
                .watch(developmentProvider)[solution.requiredDevelopmentIndex!]
                .level! >=
            solution.requiredDevelopmentLevel!) {
          return true;
        }
      }

      return false;
    }

    Row iconValue(IconData icon, Color color, double value) => Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 15,
            ),
            const SizedBox(width: 2),
            myText('-${myFormattedNumber(value)}',
                color: Colors.green.shade600, size: 12, bold: true),
          ],
        );

    return GestureDetector(
      onTap: () {
        isClickable()
            ? 
            // widget.toggleActivation(isActive, widget.index)
            setState(() {
                if (!isActive) {
                  ref.read(activationProvider.notifier).toggleActive(
                      solutionIndex: solutionIndex,
                      index: widget.index,
                      isActive: true);
                  // isActive = !isActive;
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
                  maxFontSize: 14,
                  minFontSize: 10,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  solution.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Image.asset(
                'assets/img/${solution.assetUrl}.png',
                color: isClickable() ? null : Colors.grey.shade900,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconValue(challenge.icon, challenge.color,
                        ref.watch(listenable)[widget.index].outputValue),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              ProgressBar(
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
