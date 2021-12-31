import 'package:ape_match/models/chat_room_model/chat_data.dart';
import 'package:ape_match/models/message_model/message_data.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/my_image.dart';
import 'package:ape_match/views/home_views/post_views/detail_user_view.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

Widget messageWidget(ChatRoomData chatRoomData, MessageData message,
    double width, BuildContext context) {
  if (message.uid == chatRoomData.partnerUser!.uid) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailUser(chatRoomData.partnerUser!)));
          },
          child: myImage(50,
              imageUrl: chatRoomData.partnerUser!.userImageUrl, spaceTop: 0),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width),
          child: Bubble(
            color: Colors.white,
            nipWidth: 2,
            nipHeight: 20,
            margin: const BubbleEdges.only(top: 10, left: 10),
            radius: const Radius.circular(25.0),
            padding: const BubbleEdges.all(10),
            nip: BubbleNip.leftTop,
            child: Text(
              message.message,
              style: const TextStyle(
                  fontFamily: 'Quicksand', color: Color(0xFF78808b)),
            ),
          ),
        ),
        Expanded(
          child: Text(
            _convertFromDataTime(message.createdAt),
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(
        child: Text(
          _convertFromDataTime(message.createdAt),
          textAlign: TextAlign.end,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: Bubble(
          color: Color(0xFF7dadaf),
          nipWidth: 2,
          nipHeight: 20,
          margin: const BubbleEdges.only(top: 10),
          padding: const BubbleEdges.all(10),
          radius: const Radius.circular(25.0),
          nip: BubbleNip.rightTop,
          child: Text(
            message.message,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Quicksand',
            ),
          ),
        ),
      ),
    ],
  );
}

//chatRoomのDatetimeの表示
String _convertFromDataTime(DateTime data) {
  DateFormat outputFormat = DateFormat('M/d HH:mm');
  String outPut = outputFormat.format(data);
  return outPut;
}
