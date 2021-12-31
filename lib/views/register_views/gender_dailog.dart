import 'package:ape_match/models/user_model/user_data.dart';
import 'package:ape_match/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future showDialogView(BuildContext _context, UserData userData) => showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (context) {
        return GenderView(userData);
      },
    );

class GenderView extends ConsumerStatefulWidget {
  UserData userData;
  GenderView(this.userData, {Key? key}) : super(key: key);
  @override
  GenderViewState createState() => GenderViewState();
}

class GenderViewState extends ConsumerState<GenderView> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("性別を選択してください。"),
      children: <Widget>[
        Column(
          children: <Widget>[
            ListTile(
              title: const Text('男'),
              leading: Radio<String>(
                  value: "男",
                  groupValue: ref.read(genderProvider),
                  onChanged: (String? value) =>
                      ref.watch(genderProvider.state).state = value!),
            ),
            ListTile(
              title: const Text('女'),
              leading: Radio<String>(
                value: "女",
                groupValue: ref.read(genderProvider),
                onChanged: (String? value) =>
                    ref.watch(genderProvider.state).state = value!,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                if (ref.read(genderProvider) == "女") {
                  ref.read(userProvider.state).state = widget.userData.copyWith(
                      gender: ref.read(genderProvider), userName: "山田花子");
                } else {
                  ref.read(userProvider.state).state = widget.userData;
                }
                Navigator.of(context).pop(ref.read(userProvider));
              },
              child: const Text("OK"),
            ),
          ],
        ),
      ],
    );
  }
}
