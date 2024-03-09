import 'package:flutter/material.dart';
import 'package:mother_earth/app/my_text.dart';

Wrap myIconValueTrend({
  IconData? icon,
  Color? iconColor,
  double? iconSize = 17,
  required double value,
  Color? valueColor,
  bool? isValueBold = true,
  double? valueSize = 12,
  int? decimals = 2,
}) =>
    Wrap(
      children: [
        value != 0
            ? Icon(
                value > 0 ? Icons.trending_up : Icons.trending_down,
                color: value > 0 ? Colors.red.shade600 : Colors.green.shade600,
                size: iconSize,
              )
            : const SizedBox.shrink(),
        const SizedBox(width: 2),
        myText(
          '${(value * 100).toStringAsFixed(decimals!)}%',
          bold: isValueBold,
          color: value > 0 ? Colors.red.shade600 : Colors.green.shade600,
          size: valueSize,
        ),
      ],
    );
