import 'package:ape_match/view_models/chat_room_view_model.dart';
import 'package:flutter/material.dart';

Future deleteDialog(BuildContext context, ChatRoomViewModel chatRoomViewModel,
    String documentId) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text("削除すると会話内容が見えなくなります。本当に削除しますか？"),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'はい',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () async {
              chatRoomViewModel.onDelete(documentId);
              Navigator.of(dialogContext).pop(true);
            },
          ),
          TextButton(
            child: const Text('いいえ'),
            onPressed: () {
              Navigator.of(dialogContext).pop(false);
            },
          ),
        ],
      );
    },
  );
}
