import 'package:ape_match/provider/login_view_provider.dart';
import 'package:ape_match/view_models/firebase_auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestartRegisterPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _RestartRegisterPageState createState() => _RestartRegisterPageState();
}

class _RestartRegisterPageState extends ConsumerState<RestartRegisterPage> {

  late FirebaseAuthViewModel _firebaseAuthViewModel;

  @override
  void initState() {
    // TODO: implement initState
    _firebaseAuthViewModel = FirebaseAuthViewModel(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // メールアドレス入力
              TextFormField(
                  decoration: const InputDecoration(labelText: 'メールアドレス'),
                  onChanged: (String value) =>
                  ref.watch(loginEmailProvider.state).state = value),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  // ユーザー登録ボタン
                  child: ElevatedButton(
                      child: const Text('メールを送信'),
                      onPressed: () =>
                          _firebaseAuthViewModel.logIn(context: context)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
