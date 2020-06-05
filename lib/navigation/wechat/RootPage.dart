import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/navigation/wechat/HomePage.dart';

import 'RootTabBar.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TabBarModel> pages = <TabBarModel>[
      new TabBarModel(
        title: "微信",
        page: new HomePage(content: "微信"),
        icon: new LoadImage("assets/images/tabbar_chat_c.webp"),
        selectIcon: new LoadImage("assets/images/tabbar_chat_s.webp"),
      ),
      new TabBarModel(
        title: "通讯录",
        page: new HomePage(content: "通讯录"),
        icon: new LoadImage("assets/images/tabbar_contacts_c.webp"),
        selectIcon: new LoadImage("assets/images/tabbar_contacts_s.webp"),
      ),
      new TabBarModel(
        title: "发现",
        page: new HomePage(content: "发现"),
        icon: new LoadImage("assets/images/tabbar_discover_c.webp"),
        selectIcon: new LoadImage("assets/images/tabbar_discover_s.webp"),
      ),
      new TabBarModel(
        title: "我",
        page: new HomePage(content: "我"),
        icon: new LoadImage("assets/images/tabbar_me_c.webp"),
        selectIcon: new LoadImage("assets/images/tabbar_me_s.webp"),
      ),
    ];
    return new Scaffold(
//      key: scaffoldGK,
      body: new RootTabBar(
        pages: pages,
        currentIndex: 0,
      ),
    );
  }
}

class LoadImage extends StatelessWidget {
  final String img;

  LoadImage(this.img);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 2.0),
      child: new Image.asset(
        img,
        fit: BoxFit.cover,
        gaplessPlayback: true,
      ),
    );
  }
}
