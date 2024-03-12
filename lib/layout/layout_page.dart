import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mother_earth/common/my_icon_value.dart';
import 'package:mother_earth/common/my_text.dart';
import 'package:mother_earth/layout/app_bar_flexible.dart';
import 'package:mother_earth/layout/app_bar_navigation.dart';
import 'package:mother_earth/page/solution_page.dart';
import 'package:mother_earth/layout/app_bar_bottom.dart';
import 'package:mother_earth/page/achievement_page.dart';
import 'package:mother_earth/page/development_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int pageIndex = 0;

  @override
  void initState() {
    Future(() {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Center(child: Text('Welcome to the Game')),
          content: Wrap(
            children: [
              const Text(
                  "Tap to rescue the Mother Earth (eg. lower pollution by developing renewable energy)."),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Center(
                  child: myIconValueTrend(
                      isForHealth: true, value: 0.0024, decimals: 2),
                ),
              ),
              const Text(
                  "Take care of earth's health and use your resources (money, happiness.. etc.) smartly."),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.paid,
                      color: Colors.amber.shade600,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.pets,
                      color: Colors.green.shade600,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.account_balance,
                      color: Colors.blue.shade600,
                      size: 15,
                    ),
                  ],
                ),
              ),
              myText(
                  'Be aware: \nNegative aspects to the earth will be also increased by levels.',
                  bold: true),
            ],
          ),
          backgroundColor: const Color(0xFFE6DBCA),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.grey.shade800)),
              child: myText('PLAY'),
            ),
          ],
        ),
      );
    });
    super.initState();
  }

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
          SolutionPage(),
          DevelopmentPage(),
          AchievementPage(),
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
