import 'package:ape_match/models/post_model/post_data.dart';
import 'package:ape_match/view_models/chat_room_view_model.dart';
import 'package:ape_match/view_models/post_view_model.dart';
import 'package:ape_match/views/home_views/post_views/post_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("post")
          .orderBy("createdAt", descending: true)
          .limit(20)
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
          return const Center(
            child: Text(
              "投稿がありません",
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          final _listPostData = snapshot.data?.docs
              .map((book) =>
                  PostData.fromJson(book.data() as Map<String, dynamic>))
              .toList();
          return PostView(listPostData: _listPostData!);
        }
      },
    );
  }
}

class PostView extends ConsumerStatefulWidget {
  final List<PostData> listPostData;
  const PostView({required this.listPostData});

  @override
  PostViewState createState() => PostViewState();
}

class PostViewState extends ConsumerState<PostView> {
  late final ChatRoomViewModel _chatRoomViewModel;
  late final PostViewModel _postViewModel;
  @override
  void initState() {
    _chatRoomViewModel = ChatRoomViewModel();
    _postViewModel = PostViewModel(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FutureBuilder<List<PostData>>(
        future: _postViewModel.postDataFromUidandDeleteMute(
            widget.listPostData, uid),
        builder:
            (BuildContext context, AsyncSnapshot<List<PostData>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const SizedBox(
              width: 100,
              height: 3,
              child: LinearProgressIndicator(
                minHeight: 3,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 5, left: 5),
                child: postCard(snapshot.data![i], ref, _chatRoomViewModel,
                    context, setState),
              );
            },
          );
        });
  }
}
