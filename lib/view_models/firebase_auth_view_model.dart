import 'package:ape_match/error/firebase_auth_error.dart';
import 'package:ape_match/provider/login_view_provider.dart';
import 'package:ape_match/provider/register_view_provider.dart';
import 'package:ape_match/view_models/user_view_model.dart';
import 'package:ape_match/views/error_views/error_dialog_view.dart';
import 'package:ape_match/views/register_views/gender_dailog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAuthViewModel {
  final WidgetRef _ref;

  FirebaseAuthViewModel(this._ref) {
    userViewModel.setRef(_ref);
  }

  UserViewModel userViewModel = UserViewModel();

  Future signInAnonymous(BuildContext context) async {
    FirebaseAuthResultStatus result;

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();

      if (userCredential.user == null) {
        // ユーザーが取得できなかったとき
        result = FirebaseAuthResultStatus.Undefined;
      } else {
        // ログイン成功時
        result = FirebaseAuthResultStatus.Successful;
      }
    } on FirebaseAuthException catch (error) {
      result = FirebaseAuthExceptionHandler.handleException(error);
    }

    if (result == FirebaseAuthResultStatus.Successful) {
      // ログイン成功時の処理
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final _data = UserViewModel.defaultUserData.copyWith(uid: uid);
      final newData = await showDialogView(context, _data);
      await userViewModel.setNewDataToFirestore(newData, uid);
    } else {
      final errorMessage =
          FirebaseAuthExceptionHandler.exceptionMessage(result);
      // エラー情報をユーザーにdialogで通知
      showErrorDialog(context, errorMessage);
    }
  }

  Future<void> signIn({required BuildContext context}) async {
    FirebaseAuthResultStatus result;
    try {
      final email = _ref.read(registerEmailProvider);
      final password = _ref.read(registerPasswordProvider);

      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user == null) {
        // ユーザーが取得できなかったとき
        result = FirebaseAuthResultStatus.Undefined;
      } else {
        // ログイン成功時
        result = FirebaseAuthResultStatus.Successful;
      }
    } on FirebaseAuthException catch (error) {
      // エラー時
      result = FirebaseAuthExceptionHandler.handleException(error);
    }

    if (result == FirebaseAuthResultStatus.Successful) {
      // ログイン成功時の処理
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final data = UserViewModel.defaultUserData.copyWith(uid: uid);
      final newData = await showDialogView(context, data);
      await userViewModel.setNewDataToFirestore(newData, uid);
      Navigator.of(context).pop();
    } else {
      // ログイン失敗時の処理
      final errorMessage =
          FirebaseAuthExceptionHandler.exceptionMessage(result);
      // エラー情報をユーザーにdialogで通知
      showErrorDialog(context, errorMessage);
    }
  }

  Future<void> logIn({required BuildContext context}) async {
    FirebaseAuthResultStatus result;
    try {
      final email = _ref.read(loginEmailProvider);
      final password = _ref.read(loginPasswordProvider);

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user == null) {
        // ユーザーが取得できなかったとき
        result = FirebaseAuthResultStatus.Undefined;
      } else {
        // ログイン成功時
        result = FirebaseAuthResultStatus.Successful;
      }
    } on FirebaseAuthException catch (error) {
      // エラー時
      result = FirebaseAuthExceptionHandler.handleException(error);
    }

    if (result == FirebaseAuthResultStatus.Successful) {
      // ログイン成功時の処理
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final data = UserViewModel.defaultUserData.copyWith(uid: uid);
      final newData = await showDialogView(context, data);
      await userViewModel.setNewDataToFirestore(newData, uid);
      Navigator.of(context).pop();
    } else {
      // ログイン失敗時の処理
      final errorMessage =
          FirebaseAuthExceptionHandler.exceptionMessage(result);
      // エラー情報をユーザーにdialogで通知
      showErrorDialog(context, errorMessage);
    }
  }
}
