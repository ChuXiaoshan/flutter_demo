import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/list/animated_list_one.dart';
import 'package:flutterdemo/pages/list/horizontal_list_page.dart';

import 'pages/banners/banner_page.dart';
import 'pages/navigation/BtmNavBarExp.dart';
import 'pages/navigation/wechat/RootPage.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Demo"),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RootPage();
                  },
                ),
              );
            },
            child: new Text("Wechat"),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BtmNavBarExp();
                  },
                ),
              );
            },
            child: new Text("BottomBar"),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BannerPage1();
                  },
                ),
              );
            },
            child: new Text("Banner"),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HorizontalListPage();
                  },
                ),
              );
            },
            child: new Text("List"),
          ),
        ],
      ),
    );
  }
}
