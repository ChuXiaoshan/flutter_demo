import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_home_page.dart';
import 'pages/banners/banner_page.dart';
import 'pages/list/animated_list_one.dart';
import 'pages/list/horizontal_list_page.dart';
import 'pages/list/list_load_page.dart';
import 'pages/navigation/BtmNavBarExp.dart';

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
        "home": (_) => MyHomePage(),
        "banner": (_) => BannerPage1(),
        "bottom": (_) => BtmNavBarExp(),
        "list_v": (_) => AnimatedListOnePage(),
        "list_h": (_) => HorizontalListPage(),
        "list_load": (_) => ListLoadPage(),
      },
      home: MyHomePage(),
    );
  }
}
