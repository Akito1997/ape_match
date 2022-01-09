import 'package:ape_match/view_models/firebase_auth_view_model.dart';
import 'package:ape_match/views/register_views/terms_service_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_button_view.dart';

class NotRegisterPage extends ConsumerStatefulWidget {
  const NotRegisterPage({Key? key}) : super(key: key);

  @override
  NotRegisterPageState createState() => NotRegisterPageState();
}

class NotRegisterPageState extends ConsumerState<NotRegisterPage> {
  late FirebaseAuthViewModel firebaseAuthViewModel;
  late final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    firebaseAuthViewModel = FirebaseAuthViewModel(ref);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFfff1ef),
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            appExplanation(_width),
            Expanded(
                child: Image.asset(
              "images/apeIcon.png",
            )),
            termsOfServiceButton(context),
            anonymousRegisterButton(
                _width, _scaffoldKey, firebaseAuthViewModel.signInAnonymous),
            registerButton(_width, context),
            loginButton(_width, context),
          ],
        ),
      ),
    );
  }
}
