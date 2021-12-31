import 'package:flutter/material.dart';

Widget likeCharacter({String likeCharacterName = ""}) => Padding(
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
                    "好きなキャラクター",
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Text(
              likeCharacterName,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
