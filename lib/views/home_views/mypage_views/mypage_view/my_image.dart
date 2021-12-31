import 'dart:io';
import 'dart:math';

import 'package:ape_match/views/error_views/error_dialog_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

//マイページ画面のimage
Widget myImage(double radius, {String imageUrl = ""}) => Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        width: radius + 50,
        height: radius + 50,
        child: Container(
          width: radius, // 画像の幅
          height: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Containerを丸くする
            image: DecorationImage(
              image: (imageUrl == "")
                  ? Image.asset(
                      'images/noImage.png',
                    ).image
                  : CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );

//編集外面のimage
Widget editMyImage(double radius,
        {required Function gallreyShow,
        String imageUrl = "",
        File? newImage}) =>
    Padding(
      padding: const EdgeInsets.only(top: 50),
      child: GestureDetector(
        onTap: () => gallreyShow(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: radius + 50,
              height: radius + 50,
              child: Container(
                width: radius, // 画像の幅
                height: radius,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Containerを丸くする
                  image: DecorationImage(
                      image: (newImage != null)
                          ? Image.file(
                              newImage,
                            ).image
                          : (imageUrl == "")
                              ? Image.asset(
                                  'images/noImage.png',
                                ).image
                              : CachedNetworkImageProvider(imageUrl,
                                  errorListener: () {}),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              width: radius + 50,
              height: radius + 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black12),
              child: const Icon(
                Icons.add,
                size: 40,
                color: Colors.black38,
              ),
            )
          ],
        ),
      ),
    );

Future<String> uploadFile(File _image, BuildContext context) async {
  final imageName = randomString(30);
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
      .ref()
      .child('users/${(imageName)}');

  String returnURL = "";
  try {
    firebase_storage.TaskSnapshot uploadTask = await ref.putFile(_image);
    if (uploadTask.state == firebase_storage.TaskState.success) {
      returnURL = await ref.getDownloadURL();
    }
  } catch (e) {
    showErrorDialog(context, "画像の送信に失敗しました。");
  }
  return returnURL;
}

String randomString(int length) {
  const _randomChars =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  const _charsLength = _randomChars.length;

  final rand = Random();
  final codeUnits = List.generate(
    length,
    (index) {
      final n = rand.nextInt(_charsLength);
      return _randomChars.codeUnitAt(n);
    },
  );
  return String.fromCharCodes(codeUnits);
}

void showProgressDialog(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 300),
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}
