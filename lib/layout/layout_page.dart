import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mother_earth/layout/app_bar_flexible.dart';
import 'package:mother_earth/layout/app_bar_navigation.dart';
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
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: pageIndex != 2
          ? AppBar(
              backgroundColor: const Color(0xFFE6DBCA).withOpacity(0.9),
              // elevation: 0,
              scrolledUnderElevation: 0,
              flexibleSpace: const AppBarFlexible(),
              // leading: Padding(
              //   padding: const EdgeInsets.only(left: 10),
              //   child: Lottie.network(
              //       'https://lottie.host/9b686d12-5423-4cba-a0c9-5a7cbc637664/NKFHCHs6kY.json',
              //       fit: BoxFit.contain),
              // ),
              // title: const Text('Mother Earth'),
              // actions: const [],
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
          Center(
            child: Text('Development'),
          ),
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
