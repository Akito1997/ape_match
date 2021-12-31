import 'package:flutter/cupertino.dart';

Widget bestRank({double size = 50, String rank = "ブロンズ"}) {
  final imagePath = convertImagePath(rank);

  return SizedBox(
    width: size,
    height: size,
    child: Container(
      // 画像の高さ
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Containerを丸くする
        image: DecorationImage(
            fit: BoxFit.fill, // 親Widget(今回はContainer)と同じサイズになるように調整する
            image: Image.asset(imagePath).image),
      ),
    ),
  );
}

String convertImagePath(String rank) {
  String name;
  switch (rank) {
    case "ブロンズ":
      name = "images/ranks_images/bronze.png";
      break;
    case "シルバー":
      name = "images/ranks_images/silver.png";
      break;
    case "ゴールド":
      name = "images/ranks_images/gold.png";
      break;
    case "プラチナ":
      name = "images/ranks_images/platinum.png";
      break;
    case "ダイヤ":
      name = "images/ranks_images/diamond.png";
      break;
    case "マスター":
      name = "images/ranks_images/master.png";
      break;
    case "プレデター":
      name = "images/ranks_images/predator.png";
      break;
    default:
      name = "images/ranks_images/bronze.png";
      break;
  }
  return name;
}
