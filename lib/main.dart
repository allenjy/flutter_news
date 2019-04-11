// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_news/home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
        accentColor: Colors.redAccent),
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    HomePage(),
    Text('Index 1: 视频'),
    Text('Index 2: 讲讲'),
    Text('Index 2: 我的'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.description), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), title: Text('视频')),
          BottomNavigationBarItem(icon: Icon(Icons.send), title: Text('讲讲')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
