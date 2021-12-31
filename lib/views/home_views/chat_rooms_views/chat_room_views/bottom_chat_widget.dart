import 'package:ape_match/models/chat_room_model/chat_data.dart';
import 'package:ape_match/provider/chat_view_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget bottomChatWidget(
    WidgetRef ref,
    FocusNode focusNode,
    Future Function(ChatRoomData, String) onTapSendMessage,
    ChatRoomData chatRoomData,
    TextEditingController controller) {
  return SafeArea(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                // border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                focusNode: focusNode,
                controller: controller,
                maxLines: 5,
                minLines: 1,
                onChanged: (text) {
                  ref.watch(chatProvider.state).state = text;
                },
                decoration: const InputDecoration(
                  hintText: "メッセージを記入",
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'Quicksand',
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          IconButton(
              onPressed: () async {
                await onTapSendMessage(chatRoomData, ref.read(chatProvider));
                ref.watch(chatProvider.state).state = "";
                controller.clear();
              },
              icon: const Icon(
                Icons.send,
                color: Color(0xFF78808b),
              ))
        ],
      ),
    ),
  );
}
