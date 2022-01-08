import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigatorBarItem(
        int _currentIndex, Function(int) _onItemTapped) =>
    BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.sports_esports, size: 30, color: Colors.red),
            icon: Icon(
              Icons.sports_esports,
              size: 25,
            ),
            label: "リアルタイム"),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.chat, size: 30, color: Colors.red),
            icon: Icon(
              Icons.chat,
              size: 22,
            ),
            label: "やりとり"),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.person, size: 30, color: Colors.red),
            icon: Icon(
              Icons.person,
              size: 22,
            ),
            label: "マイページ"),
      ],
      currentIndex: _currentIndex,
      fixedColor: Colors.red,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
