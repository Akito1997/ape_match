import 'package:ape_match/views/register_views/login_view.dart';
import 'package:ape_match/views/register_views/new_register_view.dart';
import 'package:flutter/material.dart';

//buttons to use in NotRegisterPage

//新規登録のボタン
Widget registerButton(double width, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: width - 100,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterPage()));
        },
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), primary: Color(0xFF0a97c1)),
        child: const Text(
          "新規登録",
          style: TextStyle(fontSize: 18),
        ),
      ),
    ),
  );
}

//ログインボタン
Widget loginButton(double width, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: width - 100,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), primary: Color(0xFF0a97c1)),
        child: const Text(
          "ログイン",
          style: TextStyle(fontSize: 18),
        ),
      ),
    ),
  );
}

//匿名でログイン
Widget anonymousRegisterButton(
    double width, GlobalKey key, Function singInAno) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: width - 100,
      height: 40,
      child: TextButton(
        child: const Text(
          "スキップ",
          style: TextStyle(fontSize: 18, color: Color(0xFF0a97c1)),
        ),
        onPressed: () async {
          await singInAno(key.currentContext);
        },
      ),
    ),
  );
}

//
Widget appExplanation(double width) {
  return Padding(
    padding: EdgeInsets.only(top: 100),
    child: SizedBox(
      width: width - 50,
      child: Column(
        children: const [
          FittedBox(
            child: Text(
              "APEXで繋がるマッチングアプリへ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "ようこそ！",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
