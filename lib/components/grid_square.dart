import 'package:flutter/material.dart';
import '../constants.dart';

class GridSquare extends StatelessWidget {
  final IconData icon;
  GridSquare({@required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kThemeColor,
      child: icon == null
          ? null
          : Icon(
              icon,
              color: kSecondaryColor,
              size: 60.0,
            ),
    );
  }
}
