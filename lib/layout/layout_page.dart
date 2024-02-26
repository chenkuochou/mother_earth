import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:mother_earth/page/challenge_page.dart';
import 'package:mother_earth/layout/app_bar_bottom.dart';

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
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 25, left: 5, bottom: 10),
          child: Row(
            children: [
              Lottie.network(
                  'https://lottie.host/9b686d12-5423-4cba-a0c9-5a7cbc637664/NKFHCHs6kY.json',
                  fit: BoxFit.contain),
              const Text('Mother Earth'),
            ],
          ),
        ),
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 10),
        //   child: Lottie.network(
        //       'https://lottie.host/9b686d12-5423-4cba-a0c9-5a7cbc637664/NKFHCHs6kY.json',
        //       fit: BoxFit.contain),
        // ),
        // title: const Text('Mother Earth'),
        actions: const [],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: AppBarBottom(),
        ),
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
            selectedIcon: Icon(Icons.construction),
            icon: Icon(
              Icons.construction_outlined,
            ),
            label: 'Development',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.military_tech),
            icon: Icon(
              Icons.military_tech_outlined,
            ),
            label: 'Leaderboard',
          ),
        ],
      ),
    );
  }
}