import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'GameScreen.dart';

class NewGameScreen extends StatefulWidget {
  static const String id = 'new_game_screen';

  @override
  _NewGameScreenState createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  bool _secondPlayerExists = true;

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
            ),
            SizedBox(
              height: 40.0,
            ),
            _secondPlayerExists
                ? OutlineButton(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    child: Text(
                      'START GAME',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        letterSpacing: 5.0,
                        fontSize: 30.0,
                        color: kSecondaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, GameScreen.id);
                    },
                  )
                : Text(
                    'Waiting for a second player to join...',
                    style: TextStyle(
                        color: kSecondaryColor,
                        letterSpacing: 2.5,
                        fontSize: 17.0),
                  ),
          ],
        ),
      ),
    );
  }
}
