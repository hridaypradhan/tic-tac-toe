import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/NewGameScreen.dart';

class CodeScreen extends StatelessWidget {
  static const String id = 'code_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTemplate(
              text: 'Start a new game',
              tapFunction: () {
                Navigator.pushNamed(context, NewGameScreen.id);
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            kGameSymbol,
            SizedBox(
              height: 30.0,
            ),
            ButtonTemplate(
              text: 'Join an existing game',
              tapFunction: null,
            ),
          ],
        ),
      ),
    );
  }
}

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
