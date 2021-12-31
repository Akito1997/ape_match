import 'package:ape_match/models/chat_room_model/chat_data.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/my_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

Widget chatCard(ChatRoomData chatData, WidgetRef ref) {
  return ListTile(
    leading:
        myImage(60, imageUrl: chatData.partnerUser!.userImageUrl, spaceTop: 0),
    title: Text(
      chatData.partnerUser!.userName,
      style: const TextStyle(fontSize: 16),
    ),
    trailing: Text(
      _convertFromDataTIme(chatData.latestMessageCreatedAt),
      style: const TextStyle(color: Colors.black54, fontSize: 12),
    ),
    subtitle: Text(
      chatData.latestMessage,
      style: const TextStyle(fontSize: 10, color: Colors.black87),
    ),
  );
}

//chatRoomのDatetimeの表示
String _convertFromDataTIme(DateTime data) {
  DateFormat outputFormat = DateFormat('yyyy/MM/dd');
  String outPut = outputFormat.format(data);
  return outPut;
}
