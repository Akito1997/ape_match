import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

late final List<Text> _currentRank = <Text>[
  const Text("ブロンズ"),
  const Text("シルバー"),
  const Text("ゴールド"),
  const Text("プラチナ"),
  const Text("ダイヤ"),
  const Text("マスター"),
  const Text("プレデター"),
];

Widget rankWidget(
    TextEditingController controller, BuildContext context, Function setState) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "最高ランク",
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
        Text(
          controller.text,
          style: const TextStyle(fontSize: 20),
        ),
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return _buidBottomPicker(
                    CupertinoPicker(
                        itemExtent: 32.0,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            controller.text = _currentRank[value].data!;
                          });
                        },
                        children: _currentRank),
                  );
                }),
            child: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black38,
              size: 40,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buidBottomPicker(Widget picker) {
  return Container(
    height: 216,
    padding: const EdgeInsets.only(top: 6),
    color: CupertinoColors.white,
    child: DefaultTextStyle(
      style: const TextStyle(
        color: CupertinoColors.black,
        fontSize: 22,
      ),
      child: GestureDetector(
        onTap: () {},
        child: SafeArea(
          top: false,
          child: picker,
        ),
      ),
    ),
  );
}
