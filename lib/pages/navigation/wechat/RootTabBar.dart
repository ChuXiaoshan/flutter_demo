import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/navigation/wechat/ComMomBar.dart';

class RootTabBar extends StatefulWidget {
  RootTabBar({this.pages, this.currentIndex = 0});

  final List pages;
  final int currentIndex;

  @override
  State<StatefulWidget> createState() => new RootTabBarState();
}

class RootTabBarState extends State<RootTabBar> {
  var pages = new List<BottomNavigationBarItem>();
  int currentIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    pageController = PageController(initialPage: currentIndex);
    for (int i = 0; i < widget.pages.length; i++) {
      TabBarModel model = widget.pages[i];
      pages.add(
        new BottomNavigationBarItem(
          icon: model.icon,
          activeIcon: model.selectIcon,
          title: new Text(model.title, style: new TextStyle(fontSize: 12.9)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: pages,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      fixedColor: Colors.green,
      unselectedItemColor: Colors.grey[800],
      onTap: (int index) {
        setState(() => currentIndex = index);
      },
      unselectedFontSize: 18.0,
      selectedFontSize: 18.0,
      elevation: 0,
    );

    var appBar = new ComMomBar(
      title: widget.pages[currentIndex].title,
      showShadow: false,
      rightDMActions: <Widget>[
        new InkWell(
          child: new Container(
            width: 60.0,
            child: new Image.asset('assets/images/search_black.webp'),
          ),
        ),
      ],
    );

    return new Scaffold(
      bottomNavigationBar: new Theme(
        data: new ThemeData(canvasColor: Colors.grey[50], highlightColor: Colors.transparent, splashColor: Colors.transparent),
        child: new Container(
          decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.2))),
          child: bottomNavigationBar,
        ),
      ),
      appBar: widget.pages[currentIndex].title != "我的" ? appBar : null,
      body: new ScrollConfiguration(
        behavior: MyBehavior(),
        child: new PageView.builder(
          itemBuilder: (BuildContext context, int index) => widget.pages[currentIndex].page,
          controller: pageController,
          itemCount: pages.length,
          physics: Platform.isAndroid ? new ClampingScrollPhysics() : new NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() => currentIndex = index);
          },
        ),
      ),
    );
  }
}

class TabBarModel {
  final String title;
  final Widget icon;
  final Widget selectIcon;
  final Widget page;

  TabBarModel({this.title, this.icon, this.selectIcon, this.page});
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildViewportChrome(context, child, axisDirection);
    }
  }
}
