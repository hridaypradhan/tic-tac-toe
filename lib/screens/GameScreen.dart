import 'package:flutter/material.dart';
import 'package:flutter_app/GridSquare.dart';
import 'package:flutter_app/constants.dart';

class GameScreen extends StatefulWidget {
  static const id = 'game_screen';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static const _CROSS_CODE = 1, _CIRCLE_CODE = 2;
  bool _isCrossTurn = true;

  List<int> _currentSymbols = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
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
                children: getGridChildren(),
              ),
            ),
          ),
          Positioned(
            top: height / 8,
            child: Text(
              _isCrossTurn ? 'X\'s turn' : 'O\'s turn',
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: 50.0,
                letterSpacing: 4.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkIfGameOver() {
    if (_currentSymbols[0] == _currentSymbols[1] &&
        _currentSymbols[1] == _currentSymbols[2] &&
        _currentSymbols[0] != 0)
      print('Game Over!');
    else if (_currentSymbols[3] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[5] &&
        _currentSymbols[3] != 0)
      print('Game Over!');
    else if (_currentSymbols[6] == _currentSymbols[7] &&
        _currentSymbols[7] == _currentSymbols[8] &&
        _currentSymbols[6] != 0)
      print('Game Over!');
    else if (_currentSymbols[0] == _currentSymbols[3] &&
        _currentSymbols[3] == _currentSymbols[6] &&
        _currentSymbols[0] != 0)
      print('Game Over!');
    else if (_currentSymbols[1] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[7] &&
        _currentSymbols[1] != 0)
      print('Game Over!');
    else if (_currentSymbols[2] == _currentSymbols[5] &&
        _currentSymbols[5] == _currentSymbols[8] &&
        _currentSymbols[2] != 0)
      print('Game Over!');
    else if (_currentSymbols[6] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[2] &&
        _currentSymbols[6] != 0)
      print('Game Over!');
    else if (_currentSymbols[0] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[8] &&
        _currentSymbols[0] != 0) print('Game Over!');
  }

  void turnOfPlay(int index) {
    if (_isCrossTurn) {
      setState(
        () {
          _currentSymbols[index] = _CROSS_CODE;
          _isCrossTurn = false;
          checkIfGameOver();
        },
      );
    } else {
      setState(
        () {
          _currentSymbols[index] = _CIRCLE_CODE;
          _isCrossTurn = true;
          checkIfGameOver();
        },
      );
    }
  }

  Widget getSquare(int decider, int index) {
    switch (decider) {
      case 1:
        return GridSquare(
          icon: Icons.close,
        );
      case 2:
        return GridSquare(
          icon: Icons.circle,
        );
      default:
        return GestureDetector(
          onTap: () {
            turnOfPlay(index);
          },
          child: GridSquare(
            icon: null,
          ),
        );
    }
  }

  List<Widget> getGridChildren() {
    List<Widget> output = [];
    for (int i = 0; i < 9; i++) output.add(getSquare(_currentSymbols[i], i));
    return output;
  }
}
