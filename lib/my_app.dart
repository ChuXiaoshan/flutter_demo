import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './my_home_page.dart';
import './routers/application.dart';
import './routers/routers.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //初始化路由
    final router = FluroRouter();
    Routers.configureRoutes(router);
    Application.router = router;

    return MaterialApp(
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.purple.shade900,
          primaryColorDark: Color(0x12005E),
          primaryColorLight: Colors.purpleAccent.shade700,
          accentColor: Colors.deepPurple.shade400),
      home: MyHomePage(),
    );
  }
}
