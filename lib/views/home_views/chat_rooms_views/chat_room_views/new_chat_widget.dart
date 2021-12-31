import 'package:ape_match/views/home_views/chat_rooms_views/bottom_chat_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget newChatWidget(WidgetRef ref, FocusNode focusNode) {
  return Column(
    children: [
      Expanded(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Text(
              "会話をしてみよう。",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
      bottomChatWidget(ref, focusNode)
    ],
  );
}
