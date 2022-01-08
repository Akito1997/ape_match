import 'package:ape_match/models/chat_room_model/chat_data.dart';
import 'package:ape_match/provider/chat_view_provider.dart';
import 'package:ape_match/provider/user_provider.dart';
import 'package:ape_match/view_models/chat_room_view_model.dart';
import 'package:ape_match/views/home_views/chat_rooms_views/chat_room_views/delete_dialog.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/my_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'chat_room_views/chat_room_view.dart';

class ChatCardWidget extends ConsumerWidget {
  late final ChatRoomViewModel _chatRoomViewModel;
  late final ChatRoomData _chatRoomData;
  late Function setState;
  ChatCardWidget(this._chatRoomData, this._chatRoomViewModel, this.setState,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.only(
          right: 10,
        ),
        alignment: AlignmentDirectional.centerEnd,
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        await deleteDialog(context, _chatRoomViewModel,
            _chatRoomData.documentId, _chatRoomData.partnerUser!.userName);
      },
      child: GestureDetector(
        onTap: () {
          _chatRoomViewModel.onTapMessage(_chatRoomData,
              ref.read(userProvider).uid, _chatRoomData.documentId);
          ref.watch(chatProvider.state).state = "";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatRoom(_chatRoomData, setState)));
        },
        child: ListTile(
          leading: myImage(60,
              imageUrl: _chatRoomData.partnerUser!.userImageUrl, spaceTop: 0),
          title: Text(
            _chatRoomData.partnerUser!.userName,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: Column(
            children: [
              Text(
                _convertFromDataTime(_chatRoomData.latestMessageCreatedAt),
                style: const TextStyle(color: Colors.black54, fontSize: 12),
              ),
              if (_chatRoomData.latestUid != ref.read(userProvider).uid &&
                  !_chatRoomData.seeFlag)
                Expanded(
                  child: Container(
                    height: 15,
                    width: 15,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFff69b4),
                    ),
                  ),
                )
              else
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
            ],
          ),
          subtitle: Text(
            _chatRoomData.latestMessage,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

//chatRoomのDatetimeの表示
String _convertFromDataTime(DateTime data) {
  DateFormat outputFormat = DateFormat('yyyy/MM/dd');
  String outPut = outputFormat.format(data);
  return outPut;
}
