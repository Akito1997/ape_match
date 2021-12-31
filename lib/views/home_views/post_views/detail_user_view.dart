import 'package:ape_match/models/user_model/user_data.dart';
import 'package:ape_match/views/home_views/post_views/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mypage_views/mypage_view/mypage_view.dart';

class DetailUser extends StatelessWidget {
  final UserData userData;
  DetailUser(this.userData, [this.setState]);
  Function? setState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "プロフィール",
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          (setState == null)
              ? showBottom(context, userData)
              : showBottom(context, userData, setState)
        ],
      ),
      body: MyPageWidget(userData: userData),
    );
  }
}
