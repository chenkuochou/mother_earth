import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/page/development_card.dart';
import 'package:mother_earth/providers/solution_provider.dart';

class DevelopmentPage extends ConsumerStatefulWidget {
  const DevelopmentPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DevelopmentPageState();
}

class _DevelopmentPageState extends ConsumerState<DevelopmentPage> {
  late List<bool> activations;

  @override
  void initState() {
    activations = List<bool>.filled(ref.read(developmentProvider).length, false,
        growable: false);
    super.initState();
  }

  toggleActive(int index) {
    setState(() {
      if (!activations[index]) {
        activations[index] = true;

        for (int i = 0; i < activations.length; i++) {
          if (i != index && activations[i] == true) {
            activations[i] = false;
          }
        }
      } else {
        activations[index] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ref.read(developmentProvider).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
                onTap: () => toggleActive(index),
                child: DevelopmentCard(
                    index: index, isActive: activations[index])),
          );
        });
  }
}

