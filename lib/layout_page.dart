import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:mother_earth/challenge/challenge_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.9),
        // elevation: 0,
        scrolledUnderElevation: 0,
        leading: Lottie.network(
            'https://lottie.host/9b686d12-5423-4cba-a0c9-5a7cbc637664/NKFHCHs6kY.json'),
        title: const Text('Mother Earth'),
        actions: const [],
      ),
      body: IndexedStack(
        index: pageIndex,
        children: const [
          ChallengePage(),
          Center(
            child: Text('Development'),
          ),
          Center(
            child: Text('Setting'),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        // height: 60,
        backgroundColor: Colors.white,
        indicatorColor: Colors.grey,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (int index) {
          HapticFeedback.selectionClick();
          setState(() {
            pageIndex = index;
          });
        },
        selectedIndex: pageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.sports_esports, size: 28),
            icon: Icon(Icons.sports_esports_outlined, size: 28),
            label: 'Challenges',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.face),
            icon: Icon(
              Icons.face_outlined,
            ),
            label: 'Development',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
