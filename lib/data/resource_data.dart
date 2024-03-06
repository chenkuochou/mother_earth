import 'package:flutter/material.dart';
import 'package:mother_earth/model/challenge_model.dart';

/// Challenge
final ChallengeModel climateChange = ChallengeModel(
  title: 'Climate Change',
  negative: 2,
  maxValue: 2000,
  icon: Icons.air,
  color: Colors.green,
);
final ChallengeModel pollution = ChallengeModel(
  title: 'Pollution',
  negative: 1.5,
  maxValue: 2000,
  icon: Icons.factory,
  color: Colors.grey.shade600,
);
