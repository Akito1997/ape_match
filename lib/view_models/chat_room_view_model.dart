import 'package:ape_match/models/chat_room_model/chat_data.dart';
import 'package:ape_match/models/chat_room_model/chat_room_data_dao.dart';
import 'package:ape_match/models/message_model/message_data_dao.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/my_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRoomViewModel {
  final ChatRoomDataDao _chatRoomDataDao = ChatRoomDataDao();
  final MessageDataDao _messageDataDao = MessageDataDao();

  Future<List<ChatRoomData>> convertNewChatRoomData(
      List<ChatRoomData> chatRoomData, String uid) {
    final data = _chatRoomDataDao.chatRoomFromUidToUserData(chatRoomData, uid);
    return data;
  }

  Future onTapSendMessage(ChatRoomData chatRoomData, String message) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await _chatRoomDataDao.setChatRoomDataToFirestore(
        chatRoomData, message, uid);
    await _messageDataDao.setMessageDataToFirestore(
        message, uid, chatRoomData.documentId);
  }

  Future onTapMessage(
      ChatRoomData chatRoomData, String myUid, String documentId) async {
    if (chatRoomData.latestUid != myUid && !chatRoomData.seeFlag) {
      _chatRoomDataDao.seeMesseage(documentId);
    }
  }

  Future onDelete(String documentId) async {
    await _chatRoomDataDao.updateMembers(documentId);
  }

  Future<ChatRoomData> startChat(String partnerUid) async {
    final myUid = FirebaseAuth.instance.currentUser!.uid;

    final _mapData = await FirebaseFirestore.instance
        .collection("chatRooms")
        .where("members", arrayContains: myUid)
        .get();
    final _listChatRoomData = _mapData.docs
        .map((book) => ChatRoomData.fromJson(book.data()))
        .toList();

    final _chatRoomData = _listChatRoomData
        .where((element) => element.members.contains(partnerUid))
        .toList();
    if (_chatRoomData.isEmpty) {
      final documentId = randomString(20);
      final data =
          await _chatRoomDataDao.setChatRoom(partnerUid, myUid, documentId);
      final _data = await convertNewChatRoomData([data], myUid);
      return _data[0];
    } else {
      final _data = await convertNewChatRoomData([_chatRoomData[0]], myUid);
      return _data[0];
    }
  }
}
