import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class GameScreen extends StatefulWidget {
  static const id = 'game_screen';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<int> _isCross = [
    0,
    1,
    2,
    0,
    1,
    2,
    0,
    1,
    2,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          color: kSecondaryColor,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            padding: EdgeInsets.all(2.0),
            children: _isCross
                .map(
                  (isCross) => getIcon(isCross),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget getIcon(int decider) {
    switch (decider) {
      case 1:
        return Container(
          color: kThemeColor,
          child: Icon(
            Icons.close,
            color: kSecondaryColor,
            size: 60.0,
          ),
        );
      case 2:
        return Container(
          color: kThemeColor,
          child: Icon(
            Icons.circle,
            color: kSecondaryColor,
            size: 60.0,
          ),
        );
      default:
        return Container(
          color: kThemeColor,
          child: null,
        );
    }
  }
}
