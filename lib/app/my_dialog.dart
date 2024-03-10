import 'package:flutter/material.dart';
import 'package:mother_earth/app/my_text.dart';
import 'package:mother_earth/model/achievement_model.dart';

Future<void> showMyDialog(BuildContext context, AchievementModel achievement) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 20,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myText(
              achievement.title,
              color: Colors.grey.shade900,
              bold: true,
              size: 30,
            ),
            const SizedBox(height: 10),
            myText(
              achievement.description,
              color: Colors.grey.shade600,
              size: 20,
            ),
          ],
        ),
        content: Image.asset('assets/img/${achievement.imageUrl}.png'),
        actions: [
          Center(
            child: FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.grey.shade800)),
              child: const Text('Save to Google Wallet'),
            ),
          ),
        ],
      );
    },
  );
}
