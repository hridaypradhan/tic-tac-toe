import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

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
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonTemplate extends StatelessWidget {
  final String text;

  ButtonTemplate({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
