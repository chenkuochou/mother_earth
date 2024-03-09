import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mother_earth/layout/app_bar_flexible.dart';
import 'package:mother_earth/layout/app_bar_navigation.dart';
import 'package:mother_earth/page/challenge_page.dart';
import 'package:mother_earth/layout/app_bar_bottom.dart';
import 'package:mother_earth/page/develpment_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: pageIndex != 2
          ? AppBar(
              backgroundColor: const Color(0xFFE6DBCA).withOpacity(0.9),
              // elevation: 0,
              scrolledUnderElevation: 0,
              flexibleSpace: const AppBarFlexible(),

              toolbarHeight: 120,
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: AppBarBottom(),
              ),
            )
          : null,
      body: IndexedStack(
        index: pageIndex,
        children: const [
          ChallengePage(),
          DevelopmentPage(),
          Center(
            child: Text('Achievements'),
          ),
        ],
      ),
      bottomNavigationBar: AppBarNavigation(
        pageIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
            HapticFeedback.selectionClick();
          });
        },
      ),
    );
  }
}
