import 'package:ape_match/models/user_model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'chat_data.dart';

class ChatRoomDataDao {
  Future<List<ChatRoomData>> chatRoomFromUidToUserData(
      List<ChatRoomData> chatRoomsData, String uid) async {
    final listChatRooms = chatRoomsData.map((chatRoom) async {
      final _searchUid =
          chatRoom.members.where((element) => (element != uid)).toList()[0];
      final userData = await _convertFromUidToUserData(_searchUid);
      final data = chatRoom.copyWith(partnerUser: userData);
      return data;
    }).toList();

    final _data = await Future.wait(listChatRooms);
    return _data;
  }

  Future<UserData> _convertFromUidToUserData(String uid) async {
    final _data =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    final userData = UserData.fromJson(_data.data()!);
    return userData;
  }

  Future setChatRoomDataToFirestore(
      ChatRoomData chatRoomData, String message, String uid) async {
    await FirebaseFirestore.instance
        .collection("chatRooms")
        .doc(chatRoomData.documentId)
        .update({
      "latestMessageCreatedAt": Timestamp.now(),
      "latestMessage": message,
      "latestUid": uid,
      "seeFlag": false
    });
  }

  Future seeMesseage(String documentId) async {
    await FirebaseFirestore.instance
        .collection("chatRooms")
        .doc(documentId)
        .update({
      "seeFlag": true,
    });
  }

  Future updateMembers(String documentId) async {
    await FirebaseFirestore.instance
        .collection("chatRooms")
        .doc(documentId)
        .update({
      "members": [],
    });
  }

  Future<ChatRoomData> setChatRoom(
      String partnerUid, String myUid, String documentId) async {
    final mapData = {
      "createdAt": Timestamp.now(),
      "latestMessage": "",
      "latestMessageCreatedAt": Timestamp.now(),
      "documentId": documentId,
      "latestUid": myUid,
      "members": [myUid, partnerUid],
      "seeFlag": false,
    };

    await FirebaseFirestore.instance
        .collection("chatRooms")
        .doc(documentId)
        .set(mapData);

    return ChatRoomData.fromJson(mapData);
  }
}
