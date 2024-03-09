import 'package:flutter/material.dart';

Wrap myIconValue(IconData icon, String value) => Wrap(
      children: [
        Icon(
          changes > 0 ? Icons.trending_up : Icons.trending_down,
          color: changes > 0 ? Colors.red.shade600 : Colors.green.shade600,
          size: 17,
        ),
        const SizedBox(width: 2),
        myText(
          changes.toStringAsFixed(4),
          bold: true,
          color: changes > 0 ? Colors.red.shade600 : Colors.green.shade600,
          size: 12,
        ),
      ],
    );
