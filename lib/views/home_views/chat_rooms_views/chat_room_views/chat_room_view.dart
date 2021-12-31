import 'package:ape_match/models/chat_room_model/chat_data.dart';
import 'package:ape_match/models/message_model/message_data.dart';
import 'package:ape_match/views/home_views/chat_rooms_views/bottom_chat_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'chat_room_app_bar.dart';
import 'message_widget.dart';
import 'new_chat_widget.dart';

class ChatRoom extends ConsumerStatefulWidget {
  ChatRoomData chatRoomData;
  ChatRoom(this.chatRoomData);

  @override
  ChatRoomState createState() => ChatRoomState();
}

class ChatRoomState extends ConsumerState<ChatRoom> {
  late FocusNode _focusNodeName;

  @override
  void initState() {
    _focusNodeName = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNodeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: chatBar(widget.chatRoomData),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("chatRooms")
                .doc(widget.chatRoomData.documentId)
                .collection("messages")
                .orderBy("createdAt", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox(
                    width: 100,
                    height: 3,
                    child: LinearProgressIndicator(
                      minHeight: 3,
                    ));
              }

              if (snapshot.data!.docs.isEmpty) {
                return newChatWidget(ref, _focusNodeName);
              }

              final _data = snapshot.data!.docs
                  .map((e) =>
                      MessageData.fromJson(e.data() as Map<String, dynamic>))
                  .toList();

              return MessageView(
                  chatRoomData: widget.chatRoomData,
                  listMessageData: _data,
                  focusNodName: _focusNodeName);
            }),
      ),
    );
  }
}

class MessageView extends ConsumerStatefulWidget {
  final List<MessageData> listMessageData;
  final ChatRoomData chatRoomData;
  final FocusNode focusNodName;

  const MessageView(
      {required this.chatRoomData,
      required this.listMessageData,
      required this.focusNodName});

  @override
  MessageViewState createState() => MessageViewState();
}

class MessageViewState extends ConsumerState<MessageView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.listMessageData.length,
            reverse: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, i) {
              final _width = MediaQuery.of(context).size.width / 2 + 40;
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: messageWidget(
                    widget.chatRoomData, widget.listMessageData[i], _width),
              );
            },
          ),
        ),
        bottomChatWidget(ref, widget.focusNodName)
      ],
    );
  }
}
