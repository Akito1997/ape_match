import 'package:ape_match/provider/login_view_provider.dart';
import 'package:ape_match/view_models/firebase_auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';

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
              // パスワード入力
              TextFormField(
                  decoration: const InputDecoration(labelText: 'パスワード'),
                  obscureText: true,
                  onChanged: (String value) =>
                      ref.watch(loginPasswordProvider.state).state = value),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  // ユーザー登録ボタン
                  child: ElevatedButton(
                      child: const Text('ログイン'),
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
