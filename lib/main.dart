import 'package:ape_match/views/home_views/home_view.dart';
import 'package:ape_match/views/register_views/not_register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

//色
//白Color(0xFFfff1ef)
//赤Color(0xFFa12f38)
//緑Color(0xFF728b4a)
//青Color(0xFF0a97c1)
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

bool isRelease() {
  bool _bool;
  const bool.fromEnvironment('dart.vm.product') ? _bool = true : _bool = false;
  return _bool;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.mPlus1pTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: GoogleFonts.mPlusRounded1c(
              color: Colors.black,
              // color: Color(0xFF78808b),
              fontSize: 25,
            ),
            iconTheme: IconThemeData(
              color: Color(0xFF728b4a),
            )),
        primaryColor: Color(0xFF728b4a),
        primaryTextTheme: TextTheme(
          subtitle1: TextStyle(color: Color(0xFF728b4a)),
        ),
        primaryIconTheme: IconThemeData(
          color: Color(0xFF728b4a),
        ),
      ),
      home: const NewWidget(),
    );
  }
}

class NewWidget extends ConsumerWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasError) {
          // ignore: avoid_print
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          // スプラッシュ画面などに書き換えても良い
          return const SizedBox();
        }

        if (snapshot.hasData) {
          // ログインしている時の処理
          return const HomePage();
        }

        //ログインしていない時の処理
        return const NotRegisterPage();
      },
    );
  }
}
