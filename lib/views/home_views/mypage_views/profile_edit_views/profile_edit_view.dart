import 'dart:io';

import 'package:ape_match/view_models/user_view_model.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/my_image.dart';
import 'package:ape_match/views/home_views/mypage_views/profile_edit_views/profile_edit_rank.dart';
import 'package:ape_match/views/home_views/mypage_views/profile_edit_views/profile_edit_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  late UserViewModel userViewModel;
  ProfileEditPage(this.userViewModel, {Key? key}) : super(key: key);
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  late List<TextEditingController> editControllers = [
    TextEditingController(text: widget.userViewModel.userData.bestRank),
    TextEditingController(text: widget.userViewModel.userData.userName),
    TextEditingController(text: widget.userViewModel.userData.likeCharacter),
    TextEditingController(text: widget.userViewModel.userData.likeWeapon),
    TextEditingController(text: widget.userViewModel.userData.playTime),
    TextEditingController(text: widget.userViewModel.userData.selfIntroduction)
  ];

  File? _image;
  final _picker = ImagePicker();

  Future<void> getImageFromGallery() async {
    final _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (_pickedFile != null) {
        _image = File(_pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width / 3;
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "プロフィールを編集",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          TextButton(
              onPressed: () => widget.userViewModel.setUpdateToFirestore(
                  context: context,
                  uid: uid,
                  image: _image,
                  editControllers: editControllers),
              child: const Text("保存"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return editMyImage(_width,
                  gallreyShow: getImageFromGallery,
                  imageUrl: widget.userViewModel.userData.userImageUrl,
                  newImage: _image);
            }
            if (index == 1) {
              return rankWidget(editControllers[0], context, setState);
            }
            return textEditWidget(index, editControllers[index - 1]);
          },
          itemCount: 7,
        ),
      ),
    );
  }
}
