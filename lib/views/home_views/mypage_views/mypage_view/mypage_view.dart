import 'package:ape_match/models/user_model/user_data.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/my_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'mypage_views/mypage_view/best_rank.dart';
import 'mypage_views/mypage_view/like_character.dart';
import 'mypage_views/mypage_view/like_weapon.dart';
import 'mypage_views/mypage_view/play_time.dart';
import 'mypage_views/mypage_view/self_Introduction.dart';
import 'mypage_views/mypage_view/user_name.dart';

class MyPageWidget extends ConsumerStatefulWidget {
  UserData? userData;
  MyPageWidget({this.userData, Key? key}) : super(key: key);
  @override
  _MyPageWidgetState createState() => _MyPageWidgetState();
}

class _MyPageWidgetState extends ConsumerState<MyPageWidget> with RouteAware {
  @override
  Widget build(BuildContext context) {
    double radius = MediaQuery.of(context).size.width / 3 + 50;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            myImage(radius, imageUrl: widget.userData!.userImageUrl),
            userName(widget.userData!.userName, widget.userData!.gender),
            bestRank(rank: widget.userData!.bestRank),
            likeCharacter(likeCharacterName: widget.userData!.likeCharacter),
            likeWeapon(likeWeaponName: widget.userData!.likeWeapon),
            playTime(playTime: widget.userData!.playTime),
            selfIntroduction(introduction: widget.userData!.selfIntroduction)
          ],
        ),
      ),
    );
  }
}
