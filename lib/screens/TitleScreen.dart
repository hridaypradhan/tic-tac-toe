import 'dart:async';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TitleScreen extends StatefulWidget {
  static String id = "title_screen";

  @override
  _TitleScreenState createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  final titleContent = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Tic Tac Toe',
        style: TextStyle(
          color: secondaryColor,
          fontSize: 30.0,
          letterSpacing: 2.0,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.close,
            color: secondaryColor,
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.circle,
            color: secondaryColor,
          ),
        ],
      ),
    ],
  );

  bool indicatorIsVisible = true, scaleAnimationIsEnabled = false;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
        seconds: 3,
      ),
      () {
        setState(
          () {
            indicatorIsVisible = false;
            scaleAnimationIsEnabled = true;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ScaleAnimatedWidget.tween(
            enabled: scaleAnimationIsEnabled,
            duration: Duration(seconds: 1),
            scaleEnabled: 4,
            scaleDisabled: 1,
            child: CircleAvatar(
              backgroundColor: themeColor,
              radius: 130.0,
            ),
          ),
          titleContent,
          Container(
            padding: EdgeInsets.only(
              bottom: 70.0,
            ),
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: indicatorIsVisible,
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
