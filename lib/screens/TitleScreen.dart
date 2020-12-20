import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TitleScreen extends StatefulWidget {
  static String id = "title_screen";

  @override
  _TitleScreenState createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen>
    with SingleTickerProviderStateMixin {
  bool indicatorIsVisible = true;

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      value: 130.0,
      lowerBound: 130.0,
      upperBound: 1000.0,
      duration: Duration(
        seconds: 3,
      ),
    );
    Timer(
      Duration(
        seconds: 3,
      ),
      () {
        setState(
          () {
            indicatorIsVisible = false;
          },
        );
        controller.forward();
        controller.addListener(() {
          setState(() {});
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: themeColor,
              radius: controller.value,
              child: Column(
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
