import 'package:flutter_riverpod/flutter_riverpod.dart';

final resourceProvider = StateProvider<List<double>>((ref) {
  return [0, 0, 0, 0, 0, 0];
});
