import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class NewGameScreen extends StatelessWidget {
  static const String id = 'new_game_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'YOUR CODE IS',
              style: TextStyle(
                color: kSecondaryColor,
                letterSpacing: 2.0,
                fontSize: 22.0,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: kSecondaryColor,
              ),
              child: Text(
                '1234',
                style: TextStyle(
                  fontSize: 50.0,
                  color: kThemeColor,
                  letterSpacing: 16.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
