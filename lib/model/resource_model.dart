import 'package:flutter/material.dart';

class ConsumableModel {
  final String title;
  final double value;

  ConsumableModel({required this.title, required this.value});
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
  final double maxValue;

  IssueModel({
    required super.title,
    required super.value,
   required this.maxValue,
  });
}
