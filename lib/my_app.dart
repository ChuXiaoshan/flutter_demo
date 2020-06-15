import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/tab/tab1_page.dart';

import 'my_home_page.dart';
import 'pages/banners/banner_page.dart';
import 'pages/list/animated_list_one.dart';
import 'pages/list/horizontal_list_page.dart';
import 'pages/list/list_load_page.dart';
import 'pages/navigation/BtmNavBarExp.dart';
import 'pages/settings/settings1_page.dart';
import 'pages/sign/sign_page.dart';
import 'pages/sign/sign_up1_page.dart';
import 'pages/sign/sign_up_page.dart';
import 'pages/web/browser_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "tab1": (_) => Tab1Page(),
        "sign": (_) => LoginPage(),
        "home": (_) => MyHomePage(),
        "sign_up": (_) => SignUpPage(),
        "banner": (_) => BannerPage1(),
        "bottom": (_) => BtmNavBarExp(),
        "browser": (_) => BrowserPage(),
        "sign_up1": (_) => SignUp1Page(),
        "list_load": (_) => ListLoadPage(),
        "settings1": (_) => Settings1Page(),
        "list_vertical": (_) => AnimatedListOnePage(),
        "list_horizontal": (_) => HorizontalListPage(),
      },
      home: MyHomePage(),
    );
  }
}
