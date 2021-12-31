import 'package:ape_match/models/chat_room_model/chat_data.dart';
import 'package:ape_match/view_models/chat_room_view_model.dart';
import 'package:ape_match/view_models/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'chat_card.dart';

class ChatPage extends ConsumerStatefulWidget {
  UserViewModel userViewModel;
  ChatPage(this.userViewModel);

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends ConsumerState<ChatPage> {
  late ChatRoomViewModel _chatRoomViewModel;

  @override
  void initState() {
    _chatRoomViewModel = ChatRoomViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("chatRooms")
          .where("members", arrayContains: widget.userViewModel.userData.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            width: 100,
            height: 3,
            child: LinearProgressIndicator(
              minHeight: 3,
            ),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              "会話相手がいません。",
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          final _listChatRoomData = snapshot.data?.docs
              .map((book) =>
                  ChatRoomData.fromJson(book.data() as Map<String, dynamic>))
              .toList();

          if (_listChatRoomData == null) return const Text("データが存在しません");

          return FutureBuilder<List<ChatRoomData>>(
              future: _chatRoomViewModel.convertNewChatRoomData(
                  _listChatRoomData, widget.userViewModel.userData.uid),
              builder: (context, AsyncSnapshot<List<ChatRoomData>> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const SizedBox(
                    width: 100,
                    height: 3,
                    child: LinearProgressIndicator(
                      minHeight: 3,
                    ),
                  );
                }
                if (snapshot.data != null) {
                  return ChatView(listChatRoomData: snapshot.data!);
                }

                return const Text("ユーザーが存在しません");
              });
        }
      },
    );
  }
}

class ChatView extends ConsumerStatefulWidget {
  final List<ChatRoomData> listChatRoomData;
  const ChatView({required this.listChatRoomData});

  @override
  ChatViewState createState() => ChatViewState();
}

class ChatViewState extends ConsumerState<ChatView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: widget.listChatRoomData.length + 1,
      itemBuilder: (context, i) {
        if (i == widget.listChatRoomData.length) {
          return const Divider(
            height: 1.2,
          );
        }

        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: chatCard(widget.listChatRoomData[i], ref),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1.2,
          height: 1,
        );
      },
    );
  }
}
