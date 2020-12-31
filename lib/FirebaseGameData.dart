import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseGameData {
  FirebaseFirestore _fireStore;

  FirebaseGameData() {
    _fireStore = FirebaseFirestore.instance;
  }

  DocumentReference getRoom(int code) =>
      _fireStore.collection('rooms').doc('room$code');

  void endGame(int code) {
    _fireStore.collection('rooms').doc('room$code').update(
      {
        'gameOver': true,
      },
    );
  }

  void destroyRoom(int code) {
    _fireStore.collection('rooms').doc('room$code').delete();
  }

  void changeTurn(int code, bool isCrossTurn) {
    DocumentReference room = _fireStore.collection('rooms').doc('room$code');
    room.update(
      {
        'isCrossTurn': isCrossTurn,
      },
    );
  }

  void joinIfGameExists(int code) async {
    DocumentReference room = _fireStore.collection('rooms').doc('room$code');
    final getRoom = await room.get();
    if (getRoom.exists)
      room.update(
        {
          'secondPlayerExists': true,
        },
      );
  }

  void updateBoardState(int code, List<dynamic> currentSymbols) {
    _fireStore.collection('rooms').doc('room$code').update(
      {
        'currentSymbols': currentSymbols,
      },
    );
  }

  void createRoom(int code) {
    _fireStore.collection('rooms').doc('room$code').set(
      {
        'code': code,
        'currentSymbols': [0, 0, 0, 0, 0, 0, 0, 0, 0],
        'gameOver': false,
        'isCrossTurn': true,
        'secondPlayerExists': false,
      },
    );
  }
}
