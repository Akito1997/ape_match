import 'package:ape_match/models/user_model/user_data.dart';
import 'package:ape_match/views/home_views/post_views/report_problem_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget showBottom(BuildContext context, UserData userData,
    [Function? setState]) {
  if (setState == null) {
    return Container();
  }

  return IconButton(
    onPressed: () async {
      var result = await showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext dialogContext) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 50,
                child: ListTile(
                  leading: const Icon(
                    Icons.person_off,
                  ),
                  title: Text(userData.userName + 'をブロックする'),
                  onTap: () => Navigator.of(context).pop(2),
                ),
              ),
              SizedBox(
                height: 50,
                child: ListTile(
                  leading: const Icon(
                    Icons.error_outline,
                  ),
                  title: const Text('問題を報告する'),
                  onTap: () => Navigator.of(dialogContext).pop(1),
                ),
              ),
              Container(
                height: 40,
              ),
            ],
          );
        },
      );
      if (result == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportProblem(userData.uid),
          ),
        );
      } else if (result == 2) {
        await confirmMuteDialogShow(context, userData.uid, setState);
        Navigator.popUntil(context, (route) => route.isFirst);
      }
    },
    icon: const Icon(
      Icons.more_vert_outlined,
      size: 30,
      color: Color(0xFF78808b),
    ),
  );
}

Future confirmMuteDialogShow(
    BuildContext context, String problemUid, Function setState) {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  return showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text("本当にブロックしますか？"),
        content: const Text("ブロックした相手の投稿や会話が見えなくなります。"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text("いいえ"),
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(dialogContext),
          ),
          CupertinoDialogAction(
            child: const Text("はい"),
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(uid)
                  .update({
                "muteList": FieldValue.arrayUnion([problemUid])
              });
              setState(() {});
              Navigator.of(dialogContext).pop();
            },
          ),
        ],
      );
    },
  );
}
