import 'package:cloud_firestore/cloud_firestore.dart';

class MessageDataDao {
  Future setMessageDataToFirestore(
      String message, String uid, String documentId) async {
    await FirebaseFirestore.instance
        .collection("chatRooms")
        .doc(documentId)
        .collection("messages")
        .add({"message": message, "createdAt": Timestamp.now(), "uid": uid});
  }
}
