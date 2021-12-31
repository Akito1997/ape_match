import 'package:ape_match/models/user_model/user_data.dart';
import 'package:ape_match/provider/user_provider.dart';
import 'package:ape_match/view_models/firebase_auth_view_model.dart';
import 'package:ape_match/view_models/user_view_model.dart';
import 'package:ape_match/views/home_views/mypage_views/mypage_view/mypage_view.dart';
import 'package:ape_match/views/home_views/post_views/message_view.dart';
import 'package:ape_match/views/home_views/post_views/post_view.dart';
import 'package:ape_match/views/register_views/not_register_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bottom_navigator_item_view.dart';
import 'chat_rooms_views/chat_rooms_view.dart';
import 'mypage_views/profile_edit_views/profile_edit_view.dart';
import 'mypage_views/setting_views/setting_view.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  late List<Widget> _pageWidgets;
  late UserViewModel userViewModel;
  late FirebaseAuthViewModel _firebaseAuthViewModel;

  @override
  void initState() {
    super.initState();
    _firebaseAuthViewModel = FirebaseAuthViewModel(ref);
    userViewModel = UserViewModel();
    userViewModel.setRef(ref);

    _pageWidgets = [
      PostPage(),
      ChatPage(userViewModel),
      MyPageWidget(userData: ref.read(userProvider)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder<DocumentSnapshot>(
        stream:
            FirebaseFirestore.instance.collection("users").doc(uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LinearProgressIndicator();
          }

          if (snapshot.data?.data() == null) {
            return NotRegisterPage();
          }

          Future.delayed(Duration.zero, () {
            final data = UserData.fromJson(
                snapshot.data!.data() as Map<String, dynamic>);
            ref.read(userProvider.state).state = data;
            _pageWidgets[2] = MyPageWidget(userData: data);
          });

          return Scaffold(
            backgroundColor:
                (_currentIndex == 0) ? const Color(0xFFfff1ef) : null,
            appBar: AppBar(
              title: (_currentIndex == 0)
                  ? const Text(
                      "リアルタイム募集",
                    )
                  : (_currentIndex == 1)
                      ? const Text("友達")
                      : const Text("マイページ"),
              leading: (_currentIndex == 2)
                  ? IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingPage()));
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: Color(0xFF78808b),
                      ),
                    )
                  : Container(),
              actions: [
                (_currentIndex == 2)
                    ? IconButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfileEditPage(userViewModel)));
                          _pageWidgets[2] =
                              MyPageWidget(userData: userViewModel.userData);
                        },
                        icon: const Icon(
                          Icons.mode_edit,
                          color: Color(0xFF78808b),
                        ),
                      )
                    : Container()
              ],
            ),
            body: _pageWidgets.elementAt(_currentIndex),
            floatingActionButton: (_currentIndex == 0)
                ? FloatingActionButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessageView(
                                  userData: userViewModel.userData)));
                    },
                    child: const Icon(
                      Icons.border_color,
                    ),
                    backgroundColor: Colors.orange[400],
                  )
                : Container(),
            bottomNavigationBar:
                bottomNavigatorBarItem(_currentIndex, _onItemTapped),
          );
        });
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index);
}
