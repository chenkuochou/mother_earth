import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mother_earth/common/my_dialog.dart';
import 'package:mother_earth/model/achievement_model.dart';
import 'package:mother_earth/providers/game_provider.dart';

class AchievementCard extends ConsumerStatefulWidget {
  const AchievementCard({
    super.key,
    required this.achievement,
    required this.isVisible,
    required this.index,
  });
  final AchievementModel achievement;
  final bool isVisible;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AchievementCardState();
}

class _AchievementCardState extends ConsumerState<AchievementCard> {
  bool isFirstClicked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isVisible
          ? () {
              showMyDialog(context, widget.achievement, isFirstClicked);
              if (isFirstClicked) {
                ref.read(achievementProvider.notifier).clicked(widget.index);
                setState(() {
                  isFirstClicked = !isFirstClicked;
                });
              }
              HapticFeedback.selectionClick();
            }
          : null,
      child: Card(
        // elevation: 50,
        // shadowColor: Colors.black,
        color: const Color(0xFFE6DBCA),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor:
                    widget.isVisible ? Colors.white : Colors.grey.shade600,
                radius: 25,
                child: widget.isVisible
                    ? CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/img/${widget.achievement.imageUrl}.png'),
                        radius: 20,
                        backgroundColor: Colors.white,
                      )
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
                widget.isVisible ? widget.achievement.title : '???',
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              AutoSizeText(
                maxFontSize: 12,
                minFontSize: 10,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                widget.isVisible ? widget.achievement.description : '...',
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
