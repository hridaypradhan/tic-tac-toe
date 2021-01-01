import 'package:flutter/material.dart';
import 'package:flutter_app/components/ButtonTemplate.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/GameScreen.dart';
import 'package:flutter_app/screens/NewGameScreen.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import '../GameData.dart';

class ChoiceScreen extends StatefulWidget {
  static const String id = 'choice_screen';

  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  int _digit1 = 0;
  int _digit2 = 0;
  int _digit3 = 0;
  int _digit4 = 0;

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
                Provider.of<GameData>(context, listen: false).setPlayerId(1);
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
                Provider.of<GameData>(context, listen: false).setPlayerId(2);
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            child: Text(
                              'ENTER GAME CODE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: kThemeColor,
                                letterSpacing: 4.0,
                              ),
                            ),
                            top: 40.0,
                          ),
                          Positioned(
                            child: OutlineButton(
                              borderSide: BorderSide(
                                color: kThemeColor,
                              ),
                              child: Text(
                                'PLAY',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 20,
                                  fontSize: 30.0,
                                  color: kThemeColor,
                                ),
                              ),
                              onPressed: () {
                                if (Provider.of<GameData>(context,
                                        listen: false)
                                    .secondPlayerJoin(makeCodeFromDigits()))
                                  Navigator.pushNamed(context, GameScreen.id);
                              },
                            ),
                            bottom: 20.0,
                          ),
                          Align(
                            child: Icon(
                              Icons.drag_handle,
                            ),
                            alignment: AlignmentDirectional.topCenter,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                NumberPicker.integer(
                                  listViewWidth: NumberPicker
                                          .kDefaultListViewCrossAxisSize /
                                      2,
                                  infiniteLoop: true,
                                  initialValue: _digit1,
                                  minValue: 0,
                                  maxValue: 9,
                                  onChanged: (num value) {
                                    setState(
                                      () => _digit1 = value,
                                    );
                                  },
                                ),
                                NumberPicker.integer(
                                  listViewWidth: NumberPicker
                                          .kDefaultListViewCrossAxisSize /
                                      2,
                                  infiniteLoop: true,
                                  initialValue: _digit2,
                                  minValue: 0,
                                  maxValue: 9,
                                  onChanged: (num value) {
                                    setState(
                                      () => _digit2 = value,
                                    );
                                  },
                                ),
                                NumberPicker.integer(
                                  listViewWidth: NumberPicker
                                          .kDefaultListViewCrossAxisSize /
                                      2,
                                  infiniteLoop: true,
                                  initialValue: _digit3,
                                  minValue: 0,
                                  maxValue: 9,
                                  onChanged: (num value) {
                                    setState(
                                      () => _digit3 = value,
                                    );
                                  },
                                ),
                                NumberPicker.integer(
                                  listViewWidth: NumberPicker
                                          .kDefaultListViewCrossAxisSize /
                                      2,
                                  infiniteLoop: true,
                                  initialValue: _digit4,
                                  minValue: 0,
                                  maxValue: 9,
                                  onChanged: (num value) {
                                    setState(
                                      () => _digit4 = value,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

  int makeCodeFromDigits() {
    return (1000 * _digit1) + (100 * _digit2) + (10 * _digit3) + (_digit4);
  }
}
