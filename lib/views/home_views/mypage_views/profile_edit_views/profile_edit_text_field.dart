import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textEditWidget(int index, TextEditingController controller) {
  if (index == 2) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: "ユーザーネーム"),
      maxLength: 6,
      maxLines: 1,
    );
  } else if (index == 3) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: "好きなキャラクター"),
      maxLines: 1,
    );
  } else if (index == 4) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: "好きな武器"),
      maxLines: 1,
    );
  } else if (index == 5) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: "プレイ時間帯"),
      maxLines: 1,
    );
  } else {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: "自己紹介"),
      maxLines: 3,
    );
  }
}
