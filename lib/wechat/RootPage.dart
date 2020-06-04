import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/wechat/RootTabBar.dart';

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
title: S.of(context).weChat,
        icon:new LoadImage("assets/images/tabbar_chat_c.webp"),
        selectIcon:new LoadImage("assets/images/tabbar_chat_s.webp"),
page:
      ),
    ];
  }
}
