import 'dart:async';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/ChoiceScreen.dart';
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
      kGameSymbol,
    ],
  );

  @override
  _TitleScreenState createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  bool indicatorIsVisible = true;
  bool internetTextIsVisible = true;
  bool scaleAnimationIsEnabled = false;
  bool opacityAnimationIsEnabled = false;

  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  void initState() {
    super.initState();
    connectivity = Connectivity();
    subscription = connectivity.onConnectivityChanged.listen(
      (event) {
        if (event != ConnectivityResult.none) {
          Timer(
            Duration(seconds: 3),
            () {
              setState(
                () {
                  indicatorIsVisible = false;
                  scaleAnimationIsEnabled = true;
                  opacityAnimationIsEnabled = true;
                  internetTextIsVisible = false;
                },
              );
            },
          );
        }
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
                  Navigator.pushNamed(context, ChoiceScreen.id);
                },
              ),
            ),
          ),
          Visibility(
            visible: internetTextIsVisible,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                bottom: 130.0,
              ),
              child: Text(
                'Make sure you\'re connected to the internet',
                style: TextStyle(
                  color: kThemeColor,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
          Visibility(
            visible: indicatorIsVisible,
            child: Container(
              padding: EdgeInsets.only(
                bottom: 70.0,
              ),
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
