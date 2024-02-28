import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/page/progress/progress_bar.dart';

class ProgressCard extends ConsumerStatefulWidget {
  const ProgressCard({
    super.key,
    required this.listenable,
    required this.notifier,
    required this.index,
  });
  final ProviderListenable listenable;
  final ProviderListenable notifier;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgressCardState();
}

class _ProgressCardState extends ConsumerState<ProgressCard> {
  bool isActive = false;
  late SolutionModel solution = ref.read(widget.listenable)[widget.index];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clickable()
            ? setState(() {
                isActive = !isActive;
                HapticFeedback.selectionClick();
              })
            : null;
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //     color: Colors.greenAccent,
          //     width: 3,
          //     strokeAlign: BorderSide.strokeAlignOutside),
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
                'assets/img/${solution.assetUrl}',
                color: clickable() ? null : Colors.grey[900],
              )),
              const Center(
                child: Text('2'),
              ),
              const SizedBox(height: 5),
              ProgressBar(
                  listenable: widget.listenable,
                  notifier: widget.notifier,
                  index: widget.index,
                  isActive: isActive),
            ],
          );
        }),
      ),
    );
  }

  bool clickable() {
    Map<SolutionModel, int>? requiredSolution = solution.requiredSolution;
    Map<DevelopmentModel, int>? requiredDevelopment =
        solution.requiredDevelopment;

    if (requiredSolution == null  
    //  requiredDevelopment == null 
        ) {
      return true;
    } else if (requiredSolution.keys.first.level! >=
        requiredSolution.values.first) {
      return true;
    }
    // else if (requiredDevelopment.keys.first.level! >=
    //     requiredDevelopment.values.first) {
    //   return true;
    // }
    else {
      return false;
    }
  }
}
