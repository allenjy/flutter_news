// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("网易"),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(99)),
                    color: Colors.redAccent),
                padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
                margin: EdgeInsets.fromLTRB(10, 12, 10, 12),
                child: Center(
                    child: Text(
                  "今日头条",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontSize: 18, color: Colors.white),
                )),
              )),
              Text("直播"),
            ],
          ),
        ),
        body: DefaultTabController(
          length: choices.length,
          child: Column(
            children: <Widget>[
              Container(
                  child: new Material(
                color: Colors.red,
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  tabs: choices.map<Widget>((Choice choice) {
                    return Tab(
                      text: choice.title,
                    );
                  }).toList(),
                ),
              )),
              Expanded(
                child: TabBarView(
                    children: choices.map<Widget>((Choice choice) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: ChoiceList(listData: listData),
                  );
                }).toList()),
              ),
            ],
          ),
        ));
  }
}

class Choice {
  const Choice({this.title, this.style});

  final String title;
  final int style;
}

class ListData {
  const ListData({this.title, this.icon, this.details});

  final String icon;
  final String title;
  final String details;
}

List<ListData> listData = List<ListData>.generate(
    20,
    (i) => ListData(
        title: '关注',
        icon:
            'http://dingyue.nosdn.127.net/rpt8qewsFPnuXEDcCLnOIslvER=2GqGEVuf=GM1sVVSNs1519609645152.jpg',
        details: '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈'));

const List<Choice> choices = <Choice>[
  Choice(title: '关注', style: 0),
  Choice(title: '视频', style: 1),
  Choice(title: '娱乐', style: 2),
  Choice(title: '体育', style: 3),
  Choice(title: '新时代', style: 4),
  Choice(title: '要闻', style: 5),
  Choice(title: '段子', style: 6),
];

class ChoiceList extends StatelessWidget {
  const ChoiceList({Key key, this.listData}) : super(key: key);

  final List<ListData> listData;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(
//        physics: const AlwaysScrollableScrollPhysics(),
          itemCount: listData.length,
          itemBuilder: (context, index) {
            ListData data = listData[index];
            return ListTile(
              title: Text(data.title),
              subtitle: Text(data.details),
              leading: Image.network(
                data.icon,
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            );
          }),
      onRefresh: () {},
    );
  }
}
