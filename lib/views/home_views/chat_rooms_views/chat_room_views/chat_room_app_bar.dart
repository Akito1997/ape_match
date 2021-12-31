import 'package:ape_match/models/chat_room_model/chat_data.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/my_image.dart';
import 'package:flutter/material.dart';

AppBar chatBar(ChatRoomData chatRoomData) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myImage(40,
            imageUrl: chatRoomData.partnerUser!.userImageUrl, spaceTop: 0),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(chatRoomData.partnerUser!.userName),
        )
      ],
    ),
  );
}
