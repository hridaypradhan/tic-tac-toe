import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonTemplate extends StatelessWidget {
  final String text;
  final Function tapFunction;

  ButtonTemplate({@required this.text, @required this.tapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Container(
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: kThemeColor,
            letterSpacing: 4.0,
          ),
        ),
      ),
    );
  }
}
