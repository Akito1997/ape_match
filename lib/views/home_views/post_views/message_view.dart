import 'package:ape_match/models/user_model/user_data.dart';
import 'package:ape_match/provider/message_view_provider.dart';
import 'package:ape_match/view_models/post_view_model.dart';
import 'package:ape_match/views/error_views/error_dialog_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageView extends ConsumerStatefulWidget {
  late UserData userData;
  MessageView({Key? key, required this.userData}) : super(key: key);

  @override
  MessageViewState createState() => MessageViewState();
}

class MessageViewState extends ConsumerState<MessageView> {
  late TextEditingController _textEditController;
  late PostViewModel _postViewModel;

  @override
  void initState() {
    _textEditController = TextEditingController();
    _postViewModel = PostViewModel(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("募集内容"),
        actions: [
          IconButton(
              onPressed: () {
                if (ref.read(messageProvider).isEmpty) {
                  showErrorDialog(context, "テキストが何も入力されていません。");
                } else {
                  _postViewModel.sendMessage(
                      widget.userData, ref.read(messageProvider));
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.send))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            controller: _textEditController,
            onChanged: (text) => ref.watch(messageProvider.state).state = text,
            maxLines: null,
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
