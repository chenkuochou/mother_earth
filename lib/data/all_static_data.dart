import 'package:flutter/material.dart';
import 'package:mother_earth/model/achievement_model.dart';
import 'package:mother_earth/model/challenge_model.dart';
import 'package:mother_earth/model/listenable_item.dart';
import 'package:mother_earth/model/solution_model.dart';

const _outputValues = [0.1, 0.13, 0.15, 0.15, 0.17, 0.2, 0.2, 0.22, 0.25];
const _outputSeconds = [1, 5, 10, 3, 7, 13, 5, 10, 15];
const _nonUsed = {ListenableItem.non: 0.0};

List<SolutionModel> climateChangeData = [
  // Mitigation
  SolutionModel(
    title: 'Reduce Waste',
    duration: Duration(seconds: _outputSeconds[0]),
    assetUrl: 'cliMitReduce',
    outputMap: {ListenableItem.challengeClimateChange: _outputValues[0]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Nature Based',
    duration: Duration(seconds: _outputSeconds[1]),
    assetUrl: 'cliMitNature',
    requiredSolMap: {ListenableItem.cliMitReduce: 5},
    outputMap: {ListenableItem.challengeClimateChange: _outputValues[1]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Efficient Energy',
    duration: Duration(seconds: _outputSeconds[2]),
    assetUrl: 'cliMitEfficient',
    consumedResMap: {ListenableItem.resTech: 30},
    outputMap: {ListenableItem.challengeClimateChange: _outputValues[2]},
  ),
  // Adaptation

  // Action
  SolutionModel(
    title: 'Reduce Footprint',
    duration: Duration(seconds: _outputSeconds[6]),
    assetUrl: 'cliActFootprint',
    requiredSolMap: {ListenableItem.cliMitEfficient: 3},
    outputMap: {ListenableItem.challengeClimateChange: _outputValues[6]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'In-time Monitoring',
    duration: Duration(seconds: _outputSeconds[7]),
    assetUrl: 'cliActMonitoring',
    requiredSolMap: {ListenableItem.cliActFootprint: 5},
    outputMap: {ListenableItem.challengeClimateChange: _outputValues[7]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Global collaboration',
    duration: Duration(seconds: _outputSeconds[8]),
    assetUrl: 'cliActGlobal',
    consumedResMap: {ListenableItem.resHappiness: 30},
    outputMap: {ListenableItem.challengeClimateChange: _outputValues[8]},
  ),
];

List<SolutionModel> pollutionData = [
  // Air
  SolutionModel(
    title: 'Renewable',
    duration: Duration(seconds: _outputSeconds[0]),
    assetUrl: 'polAirRenewable',
    outputMap: {ListenableItem.challengePollution: _outputValues[0]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Electric Cars',
    duration: Duration(seconds: _outputSeconds[1]),
    assetUrl: 'polAirEV',
    requiredSolMap: {ListenableItem.polAirRenewable: 5},
    outputMap: {ListenableItem.challengePollution: _outputValues[1]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Air Regulation',
    duration: Duration(seconds: _outputSeconds[2]),
    assetUrl: 'polAirRegulation',
    consumedResMap: {ListenableItem.resPolitics: 30},
    outputMap: {ListenableItem.challengePollution: _outputValues[2]},
  ),
  // Water
  SolutionModel(
    title: 'Reducing Use',
    duration: Duration(seconds: _outputSeconds[3]),
    assetUrl: 'polWaterReduce',
    requiredSolMap: {ListenableItem.polAirRegulation: 3},
    outputMap: {ListenableItem.challengePollution: _outputValues[3]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Waste Treatment',
    duration: Duration(seconds: _outputSeconds[4]),
    assetUrl: 'polWaterTreatment',
    requiredSolMap: {ListenableItem.polWaterReduce: 5},
    outputMap: {ListenableItem.challengePollution: _outputValues[4]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Organic Farming',
    duration: Duration(seconds: _outputSeconds[5]),
    assetUrl: 'polWaterFarming',
    consumedResMap: {ListenableItem.resMoney: 30},
    outputMap: {ListenableItem.challengePollution: _outputValues[5]},
  ),
  // Soil & Noise
  SolutionModel(
    title: 'Buying Organic',
    duration: Duration(seconds: _outputSeconds[6]),
    assetUrl: 'polSoiOrganic',
    requiredSolMap: {ListenableItem.polWaterFarming: 3},
    outputMap: {ListenableItem.challengePollution: _outputValues[6]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Land remediation',
    duration: Duration(seconds: _outputSeconds[7]),
    assetUrl: 'polSoiRemediation',
    requiredSolMap: {ListenableItem.polSoiOrganic: 5},
    outputMap: {ListenableItem.challengePollution: _outputValues[7]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Urban Planning',
    duration: Duration(seconds: _outputSeconds[8]),
    assetUrl: 'polSoiPlanning',
    consumedResMap: {ListenableItem.resPolitics: 30},
    outputMap: {ListenableItem.challengePollution: _outputValues[8]},
  ),
];

List<SolutionModel> biodiversityData = [
  // Protection & Restoration
  SolutionModel(
    title: 'Species Protection',
    duration: Duration(seconds: _outputSeconds[3]),
    assetUrl: 'bioProProtection',
    outputMap: {ListenableItem.challengeBiodiversity: _outputValues[0]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Habitat restoration',
    duration: Duration(seconds: _outputSeconds[4]),
    assetUrl: 'bioProHabitat',
    requiredSolMap: {ListenableItem.bioProProtection: 5},
    outputMap: {ListenableItem.challengeBiodiversity: _outputValues[1]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Species Reintroduction',
    duration: Duration(seconds: _outputSeconds[5]),
    assetUrl: 'bioProSpecies',
    consumedResMap: {ListenableItem.resWildlife: 30},
    outputMap: {ListenableItem.challengeBiodiversity: _outputValues[2]},
  ),
  // Education
  SolutionModel(
    title: 'Raise Awareness',
    duration: Duration(seconds: _outputSeconds[6]),
    assetUrl: 'bioEduAwareness',
    requiredSolMap: {ListenableItem.bioProSpecies: 3},
    outputMap: {ListenableItem.challengeBiodiversity: _outputValues[6]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Local Engagement',
    duration: Duration(seconds: _outputSeconds[7]),
    assetUrl: 'bioEduEngagement',
    requiredSolMap: {ListenableItem.bioEduAwareness: 5},
    outputMap: {ListenableItem.challengeBiodiversity: _outputValues[6]},
    consumedResMap: _nonUsed,
  ),
  SolutionModel(
    title: 'Financial Support',
    duration: Duration(seconds: _outputSeconds[8]),
    assetUrl: 'bioEduFinancial',
    consumedResMap: {ListenableItem.resMoney: 50},
    outputMap: {ListenableItem.challengeBiodiversity: _outputValues[8]},
  ),
];

List<DevelopmentModel> developmentData = [
  DevelopmentModel(
    title: 'Go Decentralised',
    duration: const Duration(seconds: 5),
    assetUrl: 'devDecentralised.jpg',
    outputMap: {ListenableItem.resMoney: 0.2},
  ),
  DevelopmentModel(
    title: 'Frictionless Finance',
    duration: const Duration(seconds: 10),
    assetUrl: 'devFrictionless.jpg',
    requiredDevMap: {ListenableItem.devDecentralised: 20},
    outputMap: {ListenableItem.resMoney: 0.5},
  ),
  DevelopmentModel(
    title: 'Building Tomorrow',
    duration: const Duration(seconds: 5),
    assetUrl: 'devTomorrow.jpg',
    outputMap: {ListenableItem.resTech: 0.3},
  ),
  DevelopmentModel(
    title: 'Thriving Together',
    duration: const Duration(seconds: 5),
    assetUrl: 'devThriving.jpg',
    outputMap: {ListenableItem.resWildlife: 0.3},
  ),
  DevelopmentModel(
    title: 'Civility Revolution',
    duration: const Duration(seconds: 5),
    assetUrl: 'devCivility.jpg',
    outputMap: {ListenableItem.resPolitics: 0.2},
  ),
  DevelopmentModel(
    title: 'Bridge the Divide',
    duration: const Duration(seconds: 10),
    assetUrl: 'devBridge.jpg',
    requiredDevMap: {ListenableItem.devTomorrow: 20},
    outputMap: {ListenableItem.resPolitics: 0.5},
  ),
  DevelopmentModel(
    title: 'The Happiness Project',
    duration: const Duration(seconds: 5),
    assetUrl: 'devProject.jpg',
    outputMap: {ListenableItem.resHappiness: 0.3},
  ),
];

List<ResourceModel> resourceData = [
  ResourceModel(
    title: 'Finance',
    icon: Icons.paid,
    color: Colors.amber.shade600,
    value: 40,
  ),
  ResourceModel(
    title: 'Technology',
    icon: Icons.rocket_launch,
    color: Colors.red.shade600,
    value: 40,
  ),
  ResourceModel(
    title: 'Wildlife',
    icon: Icons.pets,
    color: Colors.green.shade600,
    value: 40,
  ),
  ResourceModel(
    title: 'Politics',
    icon: Icons.account_balance,
    color: Colors.blue.shade600,
    value: 40,
  ),
  ResourceModel(
    title: 'Happiness',
    icon: Icons.favorite_sharp,
    color: Colors.purple.shade600,
    value: 40,
  ),
];

List<ChallengeModel> challengeData = [
  ChallengeModel(
    title: 'Climate Change',
    negative: 0.2,
    maxValue: 2000,
    icon: Icons.air,
    color: Colors.blue.shade600,
  ),
  ChallengeModel(
    title: 'Pollution',
    negative: 0.2,
    maxValue: 2000,
    icon: Icons.factory,
    color: Colors.brown.shade600,
  ),
  ChallengeModel(
    title: 'Biodiversity',
    negative: 0.2,
    maxValue: 2000,
    icon: Icons.factory,
    color: Colors.green.shade600,
  )
];

List<AchievementModel> achievements = [
  AchievementModel(
    title: 'Start a Game',
    description: 'Just started, nice work.',
    imageUrl: 'achFile',
  ),
  AchievementModel(
    title: 'Level 10 Reached',
    description: "You've passed your first test.",
    imageUrl: 'achLevel10',
  ),
  AchievementModel(
    title: 'Level 20 Reached',
    description: "Stronger enemies await.",
    imageUrl: 'achLevel20',
  ),
  AchievementModel(
    title: 'Level 30 Reached',
    description: "Now face even greater challenges.",
    imageUrl: 'achLevel30',
  ),
  AchievementModel(
    title: 'Level 40 Reached',
    description: "Master powerful skills and conquer the unknown.",
    imageUrl: 'achLevel40',
  ),
  AchievementModel(
    title: 'Level 50 Reached',
    description: "Oh, you're still here! (This is the last level..)",
    imageUrl: 'achLevel50',
  ),
  AchievementModel(
    title: 'Health < 75%',
    description: "Battered, but not broken. You're okey still..",
    imageUrl: 'achHealth75',
  ),
  AchievementModel(
    title: 'Health < 50%',
    description: "Feeling spry! Hanging by a thread.",
    imageUrl: 'achHealth50',
  ),
  AchievementModel(
    title: 'Health < 25%',
    description: "One hit away from needing a nap... permanently.",
    imageUrl: 'achHealth25',
  ),
  AchievementModel(
    title: 'Health < 5%',
    description: "We need a miracle.. Don't you think?",
    imageUrl: 'achHealth5',
  ),
  AchievementModel(
    title: "You're the Boss",
    description: "Money over 100. A decent chunk of change!",
    imageUrl: 'achMoney',
  ),
  AchievementModel(
    title: 'Global Leadership',
    description: "You have strategies for world domination.",
    imageUrl: 'achGlobal',
  ),
];
