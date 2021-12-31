import 'package:ape_match/provider/register_view_provider.dart';
import 'package:ape_match/view_models/firebase_auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  late FirebaseAuthViewModel _firebaseAuthViewModel;

  @override
  void initState() {
    super.initState();
    _firebaseAuthViewModel = FirebaseAuthViewModel(ref);
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
                onChanged: (String value) {
                  ref.watch(registerEmailProvider.state).state = value;
                },
              ),
              // パスワード入力
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) =>
                    ref.watch(registerPasswordProvider.state).state = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    // ユーザー登録ボタン
                    child: ElevatedButton(
                      child: const Text('ユーザー登録'),
                      onPressed: () {
                        _firebaseAuthViewModel.signIn(context: context);
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
