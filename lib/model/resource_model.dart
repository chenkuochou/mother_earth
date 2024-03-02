// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ConsumableModel {
  final String title;
  final double? value;

  ConsumableModel({
    required this.title,
    this.value = 0,
  });
}

class ResourceModel extends ConsumableModel {
  final IconData icon;
  final Color color;

  ResourceModel({
    required super.title,
    required super.value,
    required this.icon,
    required this.color,
  });
}

class IssueModel extends ConsumableModel {
  final int? level;
  final double? positive;
  final double negative;
  final double maxValue;

  IssueModel({
    required super.title,
    super.value,
    this.level = 1,
    this.positive = 0,
    required this.negative,
    required this.maxValue,
  });

  double get changes => -(positive! - negative * level!)/maxValue;

  IssueModel copyWith({
    String? title,
    double? value,
    int? level,
    double? positive,
    double? negative,
    double? maxValue,
  }) {
    return IssueModel(
      title: title ?? this.title,
      value: value ?? this.value,
      level: level ?? this.level,
      positive: positive ?? this.positive,
      negative: negative ?? this.negative,
      maxValue: maxValue ?? this.maxValue,
    );
  }
}
