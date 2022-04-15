import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget userName(String name, String gender) => Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 26,
            color: (gender == "男")
                ? Color(0xFF162255)
                : (gender == "")
                    ? Colors.black
                    : Color(0xFFf4958f)),
      ),
    );
