import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './my_app.dart';

void main() {
  runApp(MyApp());

  /// Android状态栏透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
