import 'package:ape_match/models/user_model/user_data.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/my_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'best_rank.dart';
import 'like_character.dart';
import 'like_weapon.dart';
import 'play_time.dart';
import 'self_Introduction.dart';
import 'user_name.dart';

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
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/mypageBack.png'),
        fit: BoxFit.cover,
      )),
      child: SingleChildScrollView(
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
