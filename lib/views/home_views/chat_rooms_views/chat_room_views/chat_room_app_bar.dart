import 'package:ape_match/models/chat_room_model/chat_data.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/my_image.dart';
import 'package:ape_match/views/home_views/post_views/bottom_sheet.dart';
import 'package:ape_match/views/home_views/post_views/detail_user_view.dart';
import 'package:flutter/material.dart';

AppBar chatBar(BuildContext context, ChatRoomData chatRoomData,
    [Function? setState]) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailUser(chatRoomData.partnerUser!)));
          },
          child: myImage(40,
              imageUrl: chatRoomData.partnerUser!.userImageUrl, spaceTop: 0),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            chatRoomData.partnerUser!.userName,
            style: (chatRoomData.partnerUser!.gender == "男")
                ? const TextStyle(color: Color(0xFF162255))
                : const TextStyle(color: Color(0xFFf4958f)),
          ),
        ),
        showBottom(context, chatRoomData.partnerUser!, setState)
      ],
    ),
  );
}
