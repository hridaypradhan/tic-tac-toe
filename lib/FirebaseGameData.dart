import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseGameData {
  FirebaseFirestore _fireStore;

  FirebaseGameData() {
    _fireStore = FirebaseFirestore.instance;
  }

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

  void changeTurn(int code) {
    DocumentReference room = _fireStore.collection('rooms').doc('room$code');
    room.update(
      {
        'isCrossTurn': true,
      },
    );
  }

  void joinIfGameExists(int code) async {
    DocumentReference room = _fireStore.collection('rooms').doc('room$code');
    final getResult = await room.get();
    if (getResult.exists)
      room.update(
        {
          'secondPlayerExists': true,
        },
      );
  }

  void updateBoardState(int code, List<int> currentSymbols) {
    _fireStore.collection('rooms').doc('room$code').update(
      {
        'currentSymbols': currentSymbols,
      },
    );
  }

  void createRoom(int code) {
    _fireStore.collection('rooms').doc('room$code').set(
      {
        'code': 1234,
        'currentSymbols': [0, 0, 0, 0, 0, 0, 0, 0, 0],
        'gameOver': false,
        'isCrossTurn': true,
        'secondPlayerExists': false,
      },
    );
  }
}
