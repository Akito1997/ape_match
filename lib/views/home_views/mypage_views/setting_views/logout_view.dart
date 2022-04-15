import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextButton(
          onPressed: () => logOut(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "ログアウト",
                style: TextStyle(fontSize: 17, color: Colors.black54),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
              )
            ],
          )),
    );
  }
}

void logOut(BuildContext _context) async {
  showDialog(
    context: _context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("ログアウト"),
        content: const Text(
          "ログアウトしてもよろしいですか？\nプロフィールの情報やトーク履歴は消えてしまいます。",
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("キャンセル"),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
