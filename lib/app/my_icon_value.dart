import 'package:flutter/material.dart';
import 'package:mother_earth/app/my_text.dart';

Wrap myIconValue({
  required IconData icon,
  required Color iconColor,
  double? iconSize = 17,
  required String value,
  required Color valueColor,
  bool? isValueBold = true,
  double? valueSize = 12,
}) =>
    Wrap(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        const SizedBox(width: 2),
        myText(
          value,
          bold: isValueBold,
          color: valueColor,
          size: valueSize,
        ),
      ],
    );
