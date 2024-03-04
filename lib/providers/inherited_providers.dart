import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InheritedProviders extends InheritedWidget {
  const InheritedProviders({
    super.key,
    required this.listenable,
    required this.notifier,
    required super.child,
  });
  final ProviderListenable listenable;
  final ProviderListenable notifier;

  static InheritedProviders of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedProviders>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
