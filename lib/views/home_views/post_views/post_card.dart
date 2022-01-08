import 'package:ape_match/models/post_model/post_data.dart';
import 'package:ape_match/provider/user_provider.dart';
import 'package:ape_match/view_models/chat_room_view_model.dart';
import 'package:ape_match/views/home_views/chat_rooms_views/chat_room_views/chat_room_view.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/best_rank.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/my_image.dart';
import 'package:ape_match/views/home_views/post_views/detail_user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget postCard(
    PostData postData,
    WidgetRef ref,
    ChatRoomViewModel chatRoomViewModel,
    BuildContext context,
    Function setState) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailUser(postData.userData!, setState)));
    },
    child: Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading:
            myImage(60, imageUrl: postData.userData!.userImageUrl, spaceTop: 0),
        title: Row(
          children: [
            Text(
              postData.userData!.userName,
              style: TextStyle(
                  color: (postData.userData!.gender == "男")
                      ? Color(0xFF0a97c1)
                      : Color(0xFFf4958f),
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: bestRank(size: 30, rank: postData.userData!.bestRank),
            ),
          ],
        ),
        trailing: (postData.uid == ref.read(userProvider).uid)
            ? null
            : IconButton(
                onPressed: () async {
                  final chatData =
                      await chatRoomViewModel.startChat(postData.uid);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatRoom(chatData, setState)));
                },
                icon: const Icon(
                  Icons.mail,
                  size: 34,
                  color: Color(0xFFf89930),
                ),
              ),
        subtitle: Text(
          postData.message,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ),
    ),
  );
}
