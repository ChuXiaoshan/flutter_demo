/*
 * Created by CxS on 2021/1/14 10:38
 * Description:
 */

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../demo_inherited/inherited_test_page.dart';
import '../demo_provider/provider_cart_page.dart';
import '../my_home_page.dart';
import '../pages/banners/banner_page.dart';
import '../pages/dialog/dialogs.dart';
import '../pages/home/home1_page.dart';
import '../pages/list/animated_list_one.dart';
import '../pages/list/horizontal_list_page.dart';
import '../pages/list/list_load_page.dart';
import '../pages/navigation/bottom_nav_bar.dart';
import '../pages/not_found_page.dart';
import '../pages/refresh/easy1_page.dart';
import '../pages/settings/settings1_page.dart';
import '../pages/show/bike_detail.dart';
import '../pages/show/hotel1_page.dart';
import '../pages/show/musicplayer2.dart';
import '../pages/sign/sign_page.dart';
import '../pages/sign/sign_up1_page.dart';
import '../pages/sign/sign_up_page.dart';
import '../pages/tab/tab1_page.dart';
import '../pages/theme/theme_test_page.dart';
import '../pages/web/browser_page.dart';

//页面没找到时展示的页面
var notFoundHandler = Handler(handlerFunc: (context, params) => NotFoundPage());

//root 页面
var rootHandler = Handler(handlerFunc: (context, params) {
  var color = Color(int.parse(params['color']?.first));
  var title = params['title']?.first;
  return MyHomePage(title: title, primaryColor: color);
});

//上拉加载与下拉刷新展示
var easyRefresh1Handler = Handler(handlerFunc: (context, params) {
  var color = Color(int.parse(params['color']?.first));
  var title = params['title']?.first;
  return Easy1Page(title: title, primaryColor: color);
});

// banner 展示页面
var bannerHandler = Handler(handlerFunc: (context, params) => BannerPage());

//底部导航栏展示页面
var bottomHandler = Handler(handlerFunc: (context, params) => BottomNavBar());

//弹框展示页面
var dialogsHandler = Handler(handlerFunc: (context, params) => DialogsPage());

//tab 展示
var tabHandler = Handler(handlerFunc: (context, params) => Tab1Page());

//列表纵向展示页面
var listVerticalHandler =
    Handler(handlerFunc: (context, params) => AnimatedListOnePage());

//列表横向展示
var listHorizontalHandler =
    Handler(handlerFunc: (context, params) => HorizontalListPage());

//自定义Provider 演示页面
var providerCartHandler =
    Handler(handlerFunc: (context, params) => ProviderCartPage());

//Inherited_widget 演示页面
var inheritedHandler =
    Handler(handlerFunc: (context, params) => InheritedTestPage());

//Theme 演示页面
var themeHandler = Handler(handlerFunc: (context, params) => ThemeTestPage());

//列表加载展示
var listLoadHandler = Handler(handlerFunc: (context, params) {
  var title = params['title']?.first;
  var color = Color(int.parse(params['color']?.first));
  return ListLoadPage(title: title, primaryColor: color);
});

//sign
var signHandler = Handler(handlerFunc: (context, params) {
  var color = Color(int.parse(params['color']?.first));
  var title = params['title']?.first;
  return SignPage(title: title, primaryColor: color);
});

//sign_up
var signUpHandler = Handler(handlerFunc: (context, params) {
  var color = Color(int.parse(params['color']?.first));
  var title = params['title']?.first;
  return SignUpPage(title: title, primaryColor: color);
});

//sign_up1
var signUp1Handler = Handler(handlerFunc: (context, params) {
  var color = Color(int.parse(params['color']?.first));
  var title = params['title']?.first;
  return SignUp1Page(title: title, primaryColor: color);
});

//settings1
var setting1Handler = Handler(handlerFunc: (context, params) {
  var color = Color(int.parse(params['color']?.first));
  var title = params['title']?.first;
  return Settings1Page(title: title, primaryColor: color);
});

//home1
var home1Handler = Handler(handlerFunc: (context, params) {
  var color = Color(int.parse(params['color']?.first));
  var title = params['title']?.first;
  return Home1Page(title: title, primaryColor: color);
});

//bikeDetail
var bikeDetailHandler = Handler(handlerFunc: (context, params) {
  var color = Color(int.parse(params['color']?.first));
  var title = params['title']?.first;
  return BikeDetail(title: title, primaryColor: color);
});

//hotel1
var hotel1Handler = Handler(handlerFunc: (context, params) {
  var color = Color(int.parse(params['color']?.first));
  var title = params['title']?.first;
  return Hotel1Page(title: title, primaryColor: color);
});

//music_player2
var musicPlayer2Handler = Handler(handlerFunc: (context, params) {
  var color = Color(int.parse(params['color']?.first));
  var title = params['title']?.first;
  return MusicPlayer2Page(title: title, primaryColor: color);
});

//browser_page
var browserPageHandler = Handler(handlerFunc: (context, params) {
  print("color1---$params");
  var color = Color(int.parse(params['color']?.first));
  print("color1---$color");
  var title = params['title']?.first;
  var url = params['url']?.first;
  print("url---$url");
  return BrowserPage(title: title, primaryColor: color, url: url);
});
