import 'package:flutter/widgets.dart';

/// Created by CxS on 2021/1/20 15:36

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  //需要在子树中共享的数据，保存点击次数
  final int data;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    // return context
    //     .getElementForInheritedWidgetOfExactType<ShareDataWidget>()
    //     .widget;
  }

  //该回调决定当data发生变化时，是否通知子树依赖data的widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回true，则子树中依赖（build函数中有调用）本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.data != data;
  }
}
