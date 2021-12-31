import 'dart:io';

import 'package:ape_match/models/user_model/user_data.dart';
import 'package:ape_match/models/user_model/user_data_dao.dart';
import 'package:ape_match/provider/user_provider.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/my_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserViewModel {
  UserDataDao userDataDao = UserDataDao();

  late WidgetRef _ref;

  static final UserData defaultUserData = UserData(
      createdAt: Timestamp.now().toDate(),
      userName: "山田太郎",
      uid: "",
      bestRank: "ブロンズ",
      playTime: "夜",
      muteList: <String>[],
      selfIntroduction: "ゲームを一緒に楽しみましょう。",
      likeCharacter: 'レイス',
      gender: "男",
      userImageUrl: "",
      likeWeapon: 'フラットライン');

  UserData get userData => _ref.watch(userProvider);

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  Future setNewDataToFirestore(UserData data, String uid) async {
    await userDataDao.setUserToFirestore(data, uid);
  }

  Future<void> setUpdateToFirestore(
      {required BuildContext context,
      required String uid,
      File? image,
      required List<TextEditingController> editControllers}) async {
    showProgressDialog(context);
    if (image != null) {
      final imageUrl = await uploadFile(File(image.path), context);
      final data = userData.copyWith(
          userImageUrl: imageUrl,
          bestRank: editControllers[0].text,
          userName: editControllers[1].text,
          likeCharacter: editControllers[2].text,
          likeWeapon: editControllers[3].text,
          playTime: editControllers[4].text,
          selfIntroduction: editControllers[5].text);
      await userDataDao.updateUserToFirestore(data, uid);
      _ref.read(userProvider.state).state = data;
      Navigator.of(context).pop();
      Navigator.of(context).pop(data);
    } else {
      final data = userData.copyWith(
          bestRank: editControllers[0].text,
          userName: editControllers[1].text,
          likeCharacter: editControllers[2].text,
          likeWeapon: editControllers[3].text,
          playTime: editControllers[4].text,
          selfIntroduction: editControllers[5].text);
      await userDataDao.updateUserToFirestore(data, uid);
      _ref.read(userProvider.state).state = data;
      Navigator.of(context).pop();
      Navigator.of(context).pop(data);
    }
  }
}
