import 'package:ape_match/models/chat_room_model/chat_data.dart';
import 'package:ape_match/provider/user_provider.dart';
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
          .orderBy("latestMessageCreatedAt", descending: true)
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
                  return LinearProgressIndicator(
                    minHeight: 3,
                  );
                }

                if (snapshot.data != null) {
                  return ChatView(
                    listChatRoomData: snapshot.data!,
                    chatRoomViewModel: _chatRoomViewModel,
                  );
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
  final ChatRoomViewModel chatRoomViewModel;
  const ChatView(
      {required this.listChatRoomData, required this.chatRoomViewModel});

  @override
  ChatViewState createState() {
    return ChatViewState();
  }
}

class ChatViewState extends ConsumerState<ChatView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatRoomData>>(
        future: newChatList(),
        builder: (context, AsyncSnapshot<List<ChatRoomData>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return LinearProgressIndicator(
              minHeight: 3,
            );
          }
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "会話相手がいません。",
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemCount: snapshot.data!.length + 1,
            itemBuilder: (context, i) {
              if (i == snapshot.data!.length) {
                return const Divider(
                  height: 1.2,
                );
              }
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ChatCardWidget(
                    snapshot.data![i], widget.chatRoomViewModel, setState),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 1.2,
                height: 1,
              );
            },
          );
        });
  }

  Future<List<ChatRoomData>> newChatList() async {
    return widget.listChatRoomData.where((element) {
      return !ref
          .read(userProvider)
          .muteList
          .contains(element.partnerUser!.uid);
    }).toList();
  }
}
