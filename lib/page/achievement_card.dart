import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/app/my_dialog.dart';
import 'package:mother_earth/model/achievement_model.dart';

class AchievementCard extends ConsumerWidget {
  const AchievementCard(
      {super.key, required this.achievement, required this.isVisible});
  final AchievementModel achievement;
  final bool isVisible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: isVisible
          ? () {
              showMyDialog(context, achievement);
                HapticFeedback.selectionClick();
            }
          : null,
      child: Card(
        // elevation: 50,
        // shadowColor: Colors.black,
        color: const Color(0xFFE6DBCA).withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: isVisible ? null : Colors.grey.shade600,
                radius: 25,
                child: isVisible
                    ? CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/img/${achievement.imageUrl}.png'),
                        radius: 20)
                    : null,
              ),
              const SizedBox(
                height: 5,
              ),
              AutoSizeText(
                maxFontSize: 15,
                minFontSize: 10,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                isVisible ? achievement.title : '???',
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              AutoSizeText(
                maxFontSize: 12,
                minFontSize: 10,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                isVisible ? achievement.description : '...',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey.shade600),
              ), //SizedBox
            ],
          ), //Column
        ), //SizedBox
      ),
    );
  }
}
