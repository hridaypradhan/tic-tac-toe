import 'package:flutter/material.dart';

final Color kThemeColor = Colors.blue[700];
final Color kSecondaryColor = Colors.white;

final kGameSymbol = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(
      Icons.close,
      color: kSecondaryColor,
    ),
    SizedBox(
      width: 10.0,
    ),
    Icon(
      Icons.circle,
      color: kSecondaryColor,
    ),
  ],
);
