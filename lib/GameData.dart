import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/FirebaseGameData.dart';

import 'components/GridSquare.dart';
import 'constants.dart';

class GameData extends ChangeNotifier {
  GameData() {
    generateCode();
    _firebaseGameData = FirebaseGameData();
    _firebaseGameData.getRoom(_gameCode).snapshots().listen(
      (event) {
        Map<String, dynamic> newBoardState = event.data();
        _currentSymbols = newBoardState['currentSymbols'];
        _isCrossTurn = newBoardState['isCrossTurn'];
        _secondPlayerExists = newBoardState['secondPlayerExists'];
        notifyListeners();
        print('second player is now $_secondPlayerExists');
      },
    );
  }

  void createRoom() => _firebaseGameData.createRoom(_gameCode);

  FirebaseGameData _firebaseGameData;
  bool _secondPlayerExists = false;
  bool _isCrossTurn = true;
  bool _gameSquaresEnabled = true;
  int _gameCode;
  int _playerId;
  List<dynamic> _currentSymbols = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  bool secondPlayerJoin(int code) {
    _gameCode = code;
    try {
      _firebaseGameData.joinIfGameExists(_gameCode);
      return true;
    } catch (e) {
      return false;
    }
  }

  void setPlayerId(int id) {
    _playerId = id;
  }

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
    _firebaseGameData.updateBoardState(_gameCode, _currentSymbols);
    _firebaseGameData.changeTurn(_gameCode, isCrossTurn);
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
            if ((_isCrossTurn && _playerId == 1) ||
                (!_isCrossTurn && _playerId == 2)) if (_gameSquaresEnabled)
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

  void disableBoard() {
    _gameSquaresEnabled = false;
  }

  void checkIfGameOver() {
    bool isOver = false;

    if (_currentSymbols[0] == _currentSymbols[1] &&
        _currentSymbols[1] == _currentSymbols[2] &&
        _currentSymbols[0] != 0) {
      isOver = true;
    } else if (_currentSymbols[3] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[5] &&
        _currentSymbols[3] != 0) {
      isOver = true;
    } else if (_currentSymbols[6] == _currentSymbols[7] &&
        _currentSymbols[7] == _currentSymbols[8] &&
        _currentSymbols[6] != 0) {
      isOver = true;
    } else if (_currentSymbols[0] == _currentSymbols[3] &&
        _currentSymbols[3] == _currentSymbols[6] &&
        _currentSymbols[0] != 0) {
      isOver = true;
    } else if (_currentSymbols[1] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[7] &&
        _currentSymbols[1] != 0) {
      isOver = true;
    } else if (_currentSymbols[2] == _currentSymbols[5] &&
        _currentSymbols[5] == _currentSymbols[8] &&
        _currentSymbols[2] != 0) {
      isOver = true;
    } else if (_currentSymbols[6] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[2] &&
        _currentSymbols[6] != 0) {
      isOver = true;
    } else if (_currentSymbols[0] == _currentSymbols[4] &&
        _currentSymbols[4] == _currentSymbols[8] &&
        _currentSymbols[0] != 0) {
      isOver = true;
    }
    if (isOver) {
      print('Game Over!');
      disableBoard();
      _firebaseGameData.endGame(_gameCode);
      _firebaseGameData.destroyRoom(_gameCode);
    }
  }

  bool get secondPlayerExists => _secondPlayerExists;

  bool get isCrossTurn => _isCrossTurn;

  int get gameCode => _gameCode;

  List<int> get currentSymbols => _currentSymbols;
}
