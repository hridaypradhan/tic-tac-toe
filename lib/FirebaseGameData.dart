import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseGameData {
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  bool gameExists(int code) {
    // TODO check if game exists for the code
  }

  void updateBoardState(int code) {
    // TODO update board after last move
  }

  void createRoom(int code) {
    // TODO create new room in the collection 'rooms'
  }
}
