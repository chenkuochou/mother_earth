import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InheritedProviders extends InheritedWidget {
  const InheritedProviders({
    super.key,
    required this.listenable,
    required this.notifier,
    required this.solutionIndex,
    required super.child,
  });
  final ProviderListenable listenable;
  final ProviderListenable notifier;
  final int solutionIndex;

  static InheritedProviders of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedProviders>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
