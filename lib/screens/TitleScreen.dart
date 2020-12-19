import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  static String id = "title_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: LinearProgressIndicator(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 130.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tic Tac Toe',
                    style: TextStyle(
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
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.circle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
