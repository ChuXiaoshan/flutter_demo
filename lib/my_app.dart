import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_home_page.dart';
import 'pages/banners/banner_page.dart';
import 'pages/dialog/dialogs.dart';
import 'pages/home/home1_page.dart';
import 'pages/list/animated_list_one.dart';
import 'pages/list/horizontal_list_page.dart';
import 'pages/list/list_load_page.dart';
import 'pages/navigation/BtmNavBarExp.dart';
import 'pages/refresh/easy1.dart';
import 'pages/settings/settings1_page.dart';
import 'pages/show/bike_detail.dart';
import 'pages/show/hotel1_page.dart';
import 'pages/show/musicplayer2.dart';
import 'pages/sign/sign_page.dart';
import 'pages/sign/sign_up1_page.dart';
import 'pages/sign/sign_up_page.dart';
import 'pages/tab/tab1_page.dart';
import 'pages/web/browser_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.purple.shade900,
          primaryColorDark: Color(0x12005E),
          primaryColorLight: Colors.purpleAccent.shade700,
          accentColor: Colors.deepPurple.shade400),
      routes: {
        "easy1": (_) => Easy1(),
        "tab1": (_) => Tab1Page(),
        "sign": (_) => LoginPage(),
        "show": (_) => MyHomePage(),
        "home1": (_) => Home1Page(),
        "hotel1": (_) => Hotel1Page(),
        "refresh": (_) => MyHomePage(),
        "sign_up": (_) => SignUpPage(),
        "banner": (_) => BannerPage1(),
        "dialogs": (_) => DialogsPage(),
        "bottom": (_) => BtmNavBarExp(),
        "browser": (_) => BrowserPage(),
        "sign_up1": (_) => SignUp1Page(),
        "bike_detail": (_) => BikeDetail(),
        "list_load": (_) => ListLoadPage(),
        "settings1": (_) => Settings1Page(),
        "music_player2": (_) => MusicPlayerTwoPage(),
        "list_vertical": (_) => AnimatedListOnePage(),
        "list_horizontal": (_) => HorizontalListPage(),
      },
      home: MyHomePage(),
    );
  }
}
