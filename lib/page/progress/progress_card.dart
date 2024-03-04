import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/page/progress/progress_bar.dart';
import 'package:mother_earth/providers/inherited_providers.dart';
import 'package:mother_earth/providers/solution_provider.dart';

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
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final ProviderListenable listenable2 =
        InheritedProviders.of(context).listenable;
    final SolutionModel solution = ref.read(listenable2)[widget.index];

    final ProviderListenable notifier2 =
        InheritedProviders.of(context).notifier;

    bool isClickable() {
      if (solution.requiredSolMap == null && solution.requiredDevMap == null) {
        return true;
      }

      if (solution.requiredSolMap != null) {
        if (ref.watch(listenable2)[solution.requiredSolutionIndex].level >=
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

    return GestureDetector(
      onTap: () => isClickable()
          ? setState(() {
              isActive = !isActive;
              HapticFeedback.selectionClick();
            })
          : null,
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
                child: SizedBox(
                  width: constraints.maxWidth,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: myText(solution.title, bold: true),
                  ),
                ),
              ),
              Expanded(
                  child: Image.asset(
                'assets/img/${solution.assetUrl}.png',
                color: isClickable() ? null : Colors.grey[900],
              )),
              Center(
                child:
                    Text(ref.watch(listenable2)[widget.index].level.toString()),
              ),
              const SizedBox(height: 5),
              ProgressBar(
                listenable: listenable2,
                notifier: notifier2,
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
