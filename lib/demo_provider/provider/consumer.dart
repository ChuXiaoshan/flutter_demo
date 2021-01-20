import 'package:flutter/cupertino.dart';

import 'change_notifier_provider.dart';

/// Created by CxS on 2021/1/20 14:47
/// 这是衣蛾便捷类，会获取当前context和指定数据类型的Provider

class Consumer<T> extends StatelessWidget {
  Consumer({Key key, @required this.builder, this.child})
      : assert(builder != null),
        super(key: key);

  final Widget child;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context));
  }
}
