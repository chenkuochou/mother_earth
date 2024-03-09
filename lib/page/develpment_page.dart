import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_formatted_number.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/model/solution_model.dart';
import 'package:mother_earth/page/progress/progress_bar.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class DevelopmentPage extends ConsumerWidget {
  const DevelopmentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: ref.read(developmentProvider).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: DevelopmentCard(index: index),
          );
        });
  }
}

class DevelopmentCard extends ConsumerStatefulWidget {
  const DevelopmentCard({super.key, required this.index});
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DevelopmentCardState();
}

class _DevelopmentCardState extends ConsumerState<DevelopmentCard> {
  bool isActive = false;
  late DevelopmentModel development;

  @override
  void initState() {
    super.initState();
    development = ref.read(developmentProvider)[widget.index];
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isClickable()) {
          setState(() {
            isActive = !isActive;
          });
        }
      },
      child: Container(
        height: 100,
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
                      isActive: isActive,
                    ),
                  )),
            ],
          );
        }),
      ),
    );
  }
}
