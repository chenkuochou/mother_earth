import 'package:flutter/material.dart';
import 'package:mother_earth/model/challenge_model.dart';
import 'package:mother_earth/model/listenable_item.dart';
import 'package:mother_earth/model/solution_model.dart';

List<SolutionModel> climateChangeData = [
  SolutionModel(
    title: 'Solar',
    duration: const Duration(seconds: 1),
    assetUrl: 'solar',
    outputMap: {ListenableItem.challengeClimateChange: 0.1},
  )
];

List<SolutionModel> pollutionData = [
  SolutionModel(
    title: 'Renewable',
    duration: const Duration(seconds: 1),
    assetUrl: 'airRenewable',
    outputMap: {ListenableItem.challengePollution: 0.1},
  ),
  SolutionModel(
    title: 'Electric Cars',
    duration: const Duration(seconds: 5),
    assetUrl: 'airEV',
    requiredSolMap: {ListenableItem.polAirRenewable: 3},
    outputMap: {ListenableItem.challengePollution: 0.15},
  ),
  SolutionModel(
    title: 'Air Regulation',
    duration: const Duration(seconds: 10),
    assetUrl: 'airRegulation',
    // requiredSolMap: {ListenableItem.polAirEV: 5},
    consumedResMap: {ListenableItem.resPeople: 10},
    outputMap: {ListenableItem.challengePollution: 0.25},
  ),
  SolutionModel(
    title: 'Reducing use',
    duration: const Duration(seconds: 1),
    assetUrl: 'waterReduce',
    requiredSolMap: {ListenableItem.polAirRegulation: 1},
    outputMap: {ListenableItem.challengePollution: 0.13},
  )
];

List<DevelopmentModel> developmentData = [
  DevelopmentModel(
    title: 'Education',
    duration: const Duration(seconds: 5),
    assetUrl: 'file',
    outputMap: {ListenableItem.resTech: 1},
  ),
  DevelopmentModel(
    title: 'Research',
    duration: const Duration(seconds: 10),
    assetUrl: 'file',
    requiredDevMap: {ListenableItem.devEducation: 1},
    outputMap: {ListenableItem.resTech: 5},
  ),
  DevelopmentModel(
    title: 'Agriculture',
    duration: const Duration(seconds: 5),
    assetUrl: 'file',
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
    color: Colors.green.shade600,
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
