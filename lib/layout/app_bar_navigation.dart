import 'package:flutter/material.dart';

class AppBarNavigation extends StatelessWidget {
  const AppBarNavigation(
      {super.key, required this.pageIndex, required this.onTap});
  final int pageIndex;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      elevation: 0,
      height: 60,
      backgroundColor: const Color(0xFFE6DBCA),
      indicatorColor: Colors.white,
      indicatorShape: const CircleBorder(),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      onDestinationSelected: (int index) => onTap(index),
      selectedIndex: pageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.sports_esports, size: 28),
          icon: Icon(Icons.sports_esports_outlined, size: 28),
          label: 'Challenges',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.bolt, size: 28),
          icon: Icon(Icons.bolt_outlined, size: 28),
          label: 'Development',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.military_tech, size: 28),
          icon: Icon(Icons.military_tech_outlined, size: 28),
          label: 'Achievement',
        ),
      ],
    );
  }
}
