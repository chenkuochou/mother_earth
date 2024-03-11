import 'package:flutter/material.dart';

Text myText(
  String text, {
  Color? color, //= const Color(0xffF3EAD7),
  double? size,
  bool? bold,
}) =>
    Text(text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
        ));
