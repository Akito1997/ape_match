import 'package:ape_match/views/home_views/mypage_views/setting_views/logout_view.dart';
import 'package:ape_match/views/home_views/mypage_views/setting_views/web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  final _item = <Widget>[
    TermsOfService(),
    LogOutWidget(),
  ];

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: _item.length,
        itemBuilder: (context, index) {
          return _item[index];
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Color(0XFF88a06f),
          thickness: 1,
          height: 1,
        ),
      ),
    );
  }
}
