import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget selfIntroduction({String introduction = ""}) => Padding(
      padding: const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: Colors.white),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: const [
                  Text("・"),
                  Text(
                    "自己紹介",
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Text(
              introduction,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
