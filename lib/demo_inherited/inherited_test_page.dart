import 'package:flutter/material.dart';

import './share_data_widget.dart';

/// Created by CxS on 2021/1/20 15:44

class InheritedTestPage extends StatefulWidget {
  createState() => _InheritedTestPageState();
}

class _InheritedTestPageState extends State<InheritedTestPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited test page"),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TestWidget(),
              ),
              RaisedButton(
                child: Text("Increment"),
                onPressed: () => setState(() => ++count),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestWidget extends StatefulWidget {
  createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget 中的共享数据
    return Text(ShareDataWidget.of(context).data.toString());
    // return Text("hello");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先 widget 中的 InheritedWidget 改变（updateShouldNotify 返回 true)
    //时会被调用。 如果 build 中没有依赖 InheritedWidget ，则此回调不会被调用。
    print('Dependencies change');
  }
}
