import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TitleScreen extends StatelessWidget {
  static String id = "title_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: LinearProgressIndicator(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: themeColor,
              radius: 130.0,
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
            padding: EdgeInsets.only(bottom: 70.0),
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
