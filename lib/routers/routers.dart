/*
 * Created by CxS on 2021/1/14 10:39
 * Description:
 */

import 'package:fluro/fluro.dart';

import '../routers/router_handlers.dart';

class Routers {
  static String root = '/';
  static String show = 'show';
  static String tab1 = 'tab1';
  static String hotel1 = 'hotel1';
  static String banner = 'banner';
  static String bottom = 'bottom';
  static String dialogs = 'dialogs';
  static String refresh = 'refresh';
  static String browser = 'browser';
  static String listLoad = 'list_load';
  static String easyRefresh1 = 'easy_refresh1';
  static String listVertical = 'list_vertical';
  static String listHorizontal = 'list_horizontal';
  static String providerCart = 'provider_cart';
  static String inheritedPage = 'inherited_page';
  static String themeTest = 'theme_test';

  static String sign = 'sign';
  static String home1 = 'home1';
  static String signUp = 'sign_up';
  static String signUp1 = 'sign_up1';
  static String setting1 = 'settings1';
  static String bikeDetail = 'bike_detail';
  static String musicPlayer2 = 'music_player2';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = notFoundHandler;
    router.define(tab1, handler: tabHandler);
    router.define(root, handler: rootHandler);
    router.define(show, handler: rootHandler);
    router.define(refresh, handler: rootHandler);
    router.define(banner, handler: bannerHandler);
    router.define(bottom, handler: bottomHandler);
    router.define(dialogs, handler: dialogsHandler);
    router.define(listLoad, handler: listLoadHandler);
    router.define(browser, handler: browserPageHandler);
    router.define(listVertical, handler: listVerticalHandler);
    router.define(easyRefresh1, handler: easyRefresh1Handler);
    router.define(listHorizontal, handler: listHorizontalHandler);
    router.define(providerCart, handler: providerCartHandler);
    router.define(inheritedPage, handler: inheritedHandler);
    router.define(themeTest, handler: themeHandler);

    router.define(sign, handler: signHandler);
    router.define(home1, handler: home1Handler);
    router.define(signUp, handler: signUpHandler);
    router.define(hotel1, handler: hotel1Handler);
    router.define(signUp1, handler: signUp1Handler);
    router.define(setting1, handler: setting1Handler);
    router.define(bikeDetail, handler: bikeDetailHandler);
    router.define(musicPlayer2, handler: musicPlayer2Handler);
  }
}
