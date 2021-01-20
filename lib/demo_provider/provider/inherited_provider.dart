/*
 * Created by CxS on 2021/1/20 11:34
 * Description: 一个通用的InheritedWidget，保存任何需要跨组件共享的状态。
 */

import 'package:flutter/widgets.dart';

class InheritedProvider<T> extends InheritedWidget {
  //共享状态使用泛型
  final T data;

  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
