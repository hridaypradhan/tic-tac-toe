import 'dart:math';

import 'package:flutter/material.dart';

import 'components/GridSquare.dart';
import 'constants.dart';

class GameData extends ChangeNotifier {
  GameData() {
    generateCode();
  }

  bool _secondPlayerExists = true;
  bool _isCrossTurn = true;
  bool _gameSquaresEnabled = true;
  int _gameCode;
  List<int> _currentSymbols = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  void generateCode() {
    Random random = Random();
    int code = random.nextInt(9999 - 1000) + 1000;
    _gameCode = code;
    notifyListeners();
  }

  void turnOfPlay(int index) {
    if (_isCrossTurn) {
      _currentSymbols[index] = CROSS_CODE;
      _isCrossTurn = false;
    } else {
      _currentSymbols[index] = CIRCLE_CODE;
      _isCrossTurn = true;
    }
    checkIfGameOver();
    notifyListeners();
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
            if (_gameSquaresEnabled) turnOfPlay(index);
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

  void resetBoard() {
    // _currentSymbols = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    _gameSquaresEnabled = false;
  }

  void checkIfGameOver() {
    if (_currentSymbols[0] == _currentSymbols[1] &&
        _currentSymbols[1] == _currentSymbols[2] &&
        _currentSymbols[0] != 0) {
      print('Game Over!');
      resetBoard();
    } else if (_currentSymbols[3] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[5] &&
        _currentSymbols[3] != 0) {
      print('Game Over!');
      resetBoard();
    } else if (_currentSymbols[6] == _currentSymbols[7] &&
        _currentSymbols[7] == _currentSymbols[8] &&
        _currentSymbols[6] != 0) {
      print('Game Over!');
      resetBoard();
    } else if (_currentSymbols[0] == _currentSymbols[3] &&
        _currentSymbols[3] == _currentSymbols[6] &&
        _currentSymbols[0] != 0) {
      print('Game Over!');
      resetBoard();
    } else if (_currentSymbols[1] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[7] &&
        _currentSymbols[1] != 0) {
      print('Game Over!');
      resetBoard();
    } else if (_currentSymbols[2] == _currentSymbols[5] &&
        _currentSymbols[5] == _currentSymbols[8] &&
        _currentSymbols[2] != 0) {
      print('Game Over!');
      resetBoard();
    } else if (_currentSymbols[6] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[2] &&
        _currentSymbols[6] != 0) {
      print('Game Over!');
      resetBoard();
    } else if (_currentSymbols[0] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[8] &&
        _currentSymbols[0] != 0) {
      print('Game Over!');
      resetBoard();
    }
  }

  bool get secondPlayerExists => _secondPlayerExists;

  bool get isCrossTurn => _isCrossTurn;

  int get gameCode => _gameCode;

  List<int> get currentSymbols => _currentSymbols;
}
