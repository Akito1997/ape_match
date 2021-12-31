import 'package:ape_match/models/user_model/user_data.dart';
import 'package:ape_match/views/home_views/mypage_views/my_image_view.dart';
import 'package:ape_match/views/home_views/mypage_views/profile_edit_views/profile_edit_text_field_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  late UserData userData;
  ProfileEditPage(this.userData, {Key? key}) : super(key: key);
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  late List<TextEditingController> editControllers = [
    TextEditingController(text: widget.userData.bestRank),
    TextEditingController(text: widget.userData.userName),
    TextEditingController(text: widget.userData.likeCharacter),
    TextEditingController(text: widget.userData.likeWeapon),
    TextEditingController(text: widget.userData.playTime),
    TextEditingController(text: widget.userData.selfIntroduction)
  ];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width / 3;
    return Scaffold(
      appBar: AppBar(
        title: const Text("プロフィールを編集"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return editMyImage(_width,
                  imageUrl: widget.userData.userImageUrl);
            }

            if (index == 1) {
              return TextField(
                controller: editControllers[index],
                decoration: const InputDecoration(labelText: "最高ランク"),
              );
            }
            return textEditWidget(index, editControllers[index - 1]);
          },
          itemCount: 7,
        ),
      ),
    );
  }
}
