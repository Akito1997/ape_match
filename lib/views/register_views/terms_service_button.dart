import 'package:ape_match/views/home_views/mypage_views/setting_views/web_view.dart';
import 'package:flutter/material.dart';

Widget termsOfServiceButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => WebPage())),
          child: const Text("利用規約")),
      const Text("に同意して")
    ],
  );
}
