import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportProblem extends StatefulWidget {
  String problemUid;
  ReportProblem(this.problemUid, {Key? key}) : super(key: key);

  @override
  State<ReportProblem> createState() => _ReportProblemState();
}

class _ReportProblemState extends State<ReportProblem> {
  String text = "";

  void textChange(String e) {
    text = e;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("問題を報告"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "問題と感じた理由を教えて下さい。",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            TextField(
              maxLength: 300,
              onChanged: textChange,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (text.isEmpty) return;

                  final uid = FirebaseAuth.instance.currentUser!.uid;
                  FirebaseFirestore.instance.collection("alert").add({
                    "uid": uid,
                    "problemUid": widget.problemUid,
                    "message": text,
                  });
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("送信"))
          ],
        ),
      ),
    );
  }
}
