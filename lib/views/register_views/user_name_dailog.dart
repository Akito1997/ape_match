import 'package:ape_match/provider/user_provider.dart';
import 'package:ape_match/view_models/user_view_model.dart';
import 'package:ape_match/views/error_views/error_dialog_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future userNameDialog(BuildContext _context, Function seUserDataToFirestore) {
  return showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (context) {
        return RegisterUserNameView(seUserDataToFirestore);
      });
}

class RegisterUserNameView extends ConsumerStatefulWidget {
  Function setUserDataToFirestore;
  RegisterUserNameView(this.setUserDataToFirestore, {Key? key})
      : super(key: key);
  @override
  _RegisterUserNameViewState createState() => _RegisterUserNameViewState();
}

class _RegisterUserNameViewState extends ConsumerState<RegisterUserNameView> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("ユーザーネーム"),
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                maxLength: 6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                onPressed: () async {
                  if (_textEditingController.text.isEmpty) {
                    return showErrorDialog(context, "文字を入力してください。");
                  } else {
                    final uid = FirebaseAuth.instance.currentUser!.uid;
                    final _newData = UserViewModel.defaultUserData.copyWith(
                        uid: uid,
                        userName: _textEditingController.text,
                        gender: ref.read(genderProvider));
                    await widget.setUserDataToFirestore(_newData, uid);
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                },
                child: const Text("OK"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
