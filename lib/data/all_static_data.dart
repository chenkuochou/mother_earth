import 'package:flutter/material.dart';
import 'package:mother_earth/model/achievement_model.dart';
import 'package:mother_earth/model/challenge_model.dart';
import 'package:mother_earth/model/listenable_item.dart';
import 'package:mother_earth/model/solution_model.dart';

List<SolutionModel> climateChangeData = [
  SolutionModel(
    title: 'Solar',
    duration: const Duration(seconds: 1),
    assetUrl: 'solar',
    outputMap: {ListenableItem.challengeClimateChange: 0.1},
    consumedResMap: {ListenableItem.resPeople: 0},
  )
];

List<SolutionModel> pollutionData = [
  SolutionModel(
    title: 'Renewable',
    duration: const Duration(seconds: 1),
    assetUrl: 'airRenewable',
    outputMap: {ListenableItem.challengePollution: 0.1},
    consumedResMap: {ListenableItem.resPeople: 0},
  ),
  SolutionModel(
    title: 'Electric Cars',
    duration: const Duration(seconds: 5),
    assetUrl: 'airEV',
    requiredSolMap: {ListenableItem.polAirRenewable: 3},
    outputMap: {ListenableItem.challengePollution: 0.15},
    consumedResMap: {ListenableItem.resPeople: 0},
  ),
  SolutionModel(
    title: 'Air Regulation',
    duration: const Duration(seconds: 1),
    assetUrl: 'airRegulation',
    consumedResMap: {ListenableItem.resPeople: 10},
    outputMap: {ListenableItem.challengePollution: 0.25},
  ),
  SolutionModel(
    title: 'Reducing use',
    duration: const Duration(seconds: 1),
    assetUrl: 'waterReduce',
    requiredSolMap: {ListenableItem.polAirRegulation: 1},
    outputMap: {ListenableItem.challengePollution: 0.13},
    consumedResMap: {ListenableItem.resPeople: 0},
  )
];

List<DevelopmentModel> developmentData = [
  DevelopmentModel(
    title: 'Education',
    duration: const Duration(seconds: 5),
    assetUrl: 'devForest.jpg',
    outputMap: {ListenableItem.resTech: 1},
  ),
  DevelopmentModel(
    title: 'Research',
    duration: const Duration(seconds: 10),
    assetUrl: 'devForest.jpg',
    requiredDevMap: {ListenableItem.devEducation: 1},
    outputMap: {ListenableItem.resTech: 5},
  ),
  DevelopmentModel(
    title: 'Agriculture',
    duration: const Duration(seconds: 5),
    assetUrl: 'devForest.jpg',
    outputMap: {ListenableItem.resPeople: 1},
  ),
];

List<ResourceModel> resourceData = [
  ResourceModel(
    title: 'Money',
    icon: Icons.paid,
    color: Colors.amber.shade600,
  ),
  ResourceModel(
    title: 'Tech',
    icon: Icons.rocket_launch,
    color: Colors.red.shade600,
  ),
  ResourceModel(
    title: 'People',
    icon: Icons.favorite_sharp,
    color: Colors.green.shade600,value: 11,
  ),
  ResourceModel(
    title: 'Industry',
    icon: Icons.apartment,
    color: Colors.blue.shade600,
  ),
  ResourceModel(
    title: 'Gift',
    icon: Icons.redeem,
    color: Colors.purple.shade600,
  ),
];

List<ChallengeModel> challengeData = [
  ChallengeModel(
    title: 'Climate Change',
    negative: 0.2,
    maxValue: 2000,
    icon: Icons.air,
    color: Colors.green,
  ),
  ChallengeModel(
    title: 'Pollution',
    negative: 0.2, //1.5,
    maxValue: 2000,
    icon: Icons.factory,
    color: Colors.brown.shade600,
  )
];

List<AchievementModel> achievements = [
  AchievementModel(
    title: 'Stat a Game',
    description: 'Just started, nice work.',
    imageUrl: 'file',
  ),
  AchievementModel(
    title: 'Level 10 Reached',
    description: "You've passed your first test.",
    imageUrl: 'solar',
  ),
  AchievementModel(
    title: 'Level 20 Reached',
    description: "Stronger enemies await.",
    imageUrl: 'solar',
  ),
  AchievementModel(
    title: 'Level 30 Reached',
    description: "Now face even greater challenges.",
    imageUrl: 'solar',
  ),
  AchievementModel(
    title: 'Level 40 Reached',
    description: "Master powerful skills and conquer the unknown.",
    imageUrl: 'solar',
  ),
  AchievementModel(
    title: 'Level 50 Reached',
    description: "The fate of the world may rest on you.",
    imageUrl: 'solar',
  ),
];
