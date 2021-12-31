import 'package:ape_match/models/chat_room_model/chat_data.dart';
import 'package:ape_match/views/home_views/chat_rooms_views/chat_room_views/bottom_chat_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget newChatWidget(
    WidgetRef ref,
    FocusNode focusNode,
    Future Function(ChatRoomData, String) func,
    ChatRoomData chatRoomData,
    TextEditingController controller) {
  return Column(
    children: [
      const Expanded(
        child: Center(
          child: Text(
            "会話をしてみよう。",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      bottomChatWidget(ref, focusNode, func, chatRoomData, controller)
    ],
  );
}
