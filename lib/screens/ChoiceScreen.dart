import 'package:flutter/material.dart';
import 'package:flutter_app/components/ButtonTemplate.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/NewGameScreen.dart';
import 'package:numberpicker/numberpicker.dart';

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
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.drag_handle),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                NumberPicker.integer(
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
}
