import 'dart:async';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class TitleScreen extends StatefulWidget {
  static final String id = "title_screen";
  final titleContent = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Tic Tac Toe',
        style: TextStyle(
          color: kSecondaryColor,
          fontSize: 30.0,
          letterSpacing: 10.0,
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
            color: kSecondaryColor,
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.circle,
            color: kSecondaryColor,
          ),
        ],
      ),
    ],
  );

  @override
  _TitleScreenState createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  bool indicatorIsVisible = true;
  bool scaleAnimationIsEnabled = false;
  bool opacityAnimationIsEnabled = false;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        setState(
          () {
            indicatorIsVisible = false;
            scaleAnimationIsEnabled = true;
            opacityAnimationIsEnabled = true;
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
            scaleEnabled: 5,
            scaleDisabled: 1,
            child: CircleAvatar(
              backgroundColor: kThemeColor,
              radius: 160.0,
            ),
          ),
          widget.titleContent,
          Positioned(
            bottom: 80.0,
            child: OpacityAnimatedWidget.tween(
              enabled: opacityAnimationIsEnabled,
              opacityDisabled: 0,
              opacityEnabled: 1,
              duration: Duration(seconds: 2),
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                child: Text(
                  'PLAY',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    letterSpacing: 20,
                    fontSize: 30.0,
                    color: kSecondaryColor,
                  ),
                ),
                onPressed: () {
                  print('Hello');
                },
              ),
            ),
          ),
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
