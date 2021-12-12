import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:provider/provider.dart';
import '../game_data.dart';

class GameScreen extends StatelessWidget {
  static const id = 'game_screen';

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Consumer<GameData>(
      builder: (context, gameData, child) {
        return WillPopScope(
          onWillPop: () async {
            gameData.generateCode();
            return true;
          },
          child: Scaffold(
            backgroundColor: kThemeColor,
            body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    color: kSecondaryColor,
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      padding: EdgeInsets.all(2.0),
                      children: gameData.getGridChildren(),
                    ),
                  ),
                ),
                Positioned(
                  top: height / 8,
                  child: Text(
                    gameData.isCrossTurn ? 'X\'s turn' : 'O\'s turn',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 45.0,
                      letterSpacing: 4.0,
                    ),
                  ),
                ),
                Positioned(
                  bottom: height / 8,
                  child: OpacityAnimatedWidget.tween(
                    enabled: gameData.winnerTextVisible,
                    duration: Duration(seconds: 1),
                    opacityDisabled: 0,
                    opacityEnabled: 1,
                    child: Text(
                      '${gameData.winner} won!',
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 45.0,
                        letterSpacing: 4.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
