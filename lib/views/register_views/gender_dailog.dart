import 'package:ape_match/provider/user_provider.dart';
import 'package:ape_match/views/register_views/user_name_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future showDialogView(BuildContext _context, Function setNewData) => showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (context) {
        return GenderView(setNewData);
      },
    );

class GenderView extends ConsumerStatefulWidget {
  Function setNewData;
  GenderView(this.setNewData, {Key? key}) : super(key: key);

  @override
  GenderViewState createState() => GenderViewState();
}

class GenderViewState extends ConsumerState<GenderView> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("性別を選択してください。※後から変更できません"),
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
            ListTile(
              title: const Text('指定しない'),
              leading: Radio<String>(
                  value: "",
                  groupValue: ref.read(genderProvider),
                  onChanged: (String? value) =>
                      ref.watch(genderProvider.state).state = value!),
            ),
            FloatingActionButton(
              onPressed: () async {
                Navigator.popUntil(context, (route) => route.isFirst);
                await userNameDialog(context, widget.setNewData);
              },
              child: const Text("OK"),
            ),
          ],
        ),
      ],
    );
  }
}
