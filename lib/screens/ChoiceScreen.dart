import 'package:flutter/material.dart';
import 'package:flutter_app/components/ButtonTemplate.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/NewGameScreen.dart';

class ChoiceScreen extends StatefulWidget {
  static const String id = 'choice_screen';

  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
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
              tapFunction: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    margin: EdgeInsets.only(top: 50.0),
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Text('Hello'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
