import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/providers/game_provider.dart';

class AppBarNavigation extends ConsumerStatefulWidget {
  const AppBarNavigation(
      {super.key, required this.pageIndex, required this.onTap});
  final int pageIndex;
  final Function onTap;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AppBarNavigationState();
}

class _AppBarNavigationState extends ConsumerState<AppBarNavigation> {
  bool _hasBadge = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<List<bool>>(achievementUnlockedProvider,
        (List<bool>? previousState, List<bool> newState) {
      if (!listEquals(previousState, newState)) {
        setState(() {
          _hasBadge = !_hasBadge;
        });
      }
    });

    return NavigationBar(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      elevation: 0,
      height: 60,
      backgroundColor: const Color(0xFFE6DBCA),
      indicatorColor: Colors.white,
      indicatorShape: const CircleBorder(),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      onDestinationSelected: (int index) {
        widget.onTap(index);
        if (index == 2 && _hasBadge) {
          setState(() {
            _hasBadge = false;
          });
        }
      },
      selectedIndex: widget.pageIndex,
      destinations: [
        const NavigationDestination(
          selectedIcon: Icon(Icons.sports_esports, size: 28),
          icon: Icon(Icons.sports_esports_outlined, size: 28),
          label: 'Challenges',
        ),
        const NavigationDestination(
          selectedIcon: Icon(Icons.bolt, size: 28),
          icon: Icon(Icons.bolt_outlined, size: 28),
          label: 'Development',
        ),
        NavigationDestination(
          selectedIcon: const Icon(Icons.military_tech, size: 28),
          icon: _hasBadge
              ? const Badge(
                  label: Text('1'),
                  child: Icon(Icons.military_tech_outlined, size: 28))
              : const Icon(Icons.military_tech_outlined, size: 28),
          label: 'Achievement',
        ),
      ],
    );
  }
}
