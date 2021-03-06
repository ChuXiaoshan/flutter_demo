import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../widget/sample_list_item.dart';

class Easy1Page extends StatefulWidget {
  Easy1Page({String title = 'Flutter Demo', Color primaryColor})
      : this.primaryColor = primaryColor,
        this.title = title;

  final String title;
  final Color primaryColor;

  createState() => _Easy1Page(title: title, primaryColor: primaryColor);
}

class _Easy1Page extends State<Easy1Page> {
  _Easy1Page({String title, Color primaryColor})
      : this.primaryColor = primaryColor,
        this.title = title;

  Color primaryColor;
  String title;

  EasyRefreshController _controller;

  // 条目总数
  int _count = 20;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(title),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          child: EasyRefresh.custom(
            controller: _controller,
            enableControlFinishRefresh: true,
            enableControlFinishLoad: true,
            header: ClassicalHeader(
              enableInfiniteRefresh: false,
              infoColor: Colors.teal,
              float: false,
              enableHapticFeedback: true,
              refreshText: '拉动刷新',
              refreshReadyText: '释放刷新',
              refreshingText: '正在刷新...',
              refreshedText: '刷新完成',
              refreshFailedText: '刷新失败',
              noMoreText: '没有更多数据',
              infoText: '更新于 %T',
            ),
            footer: ClassicalFooter(
              enableInfiniteLoad: true,
              enableHapticFeedback: true,
              loadText: '拉动加载',
              loadReadyText: '释放加载',
              loadingText: '正在加载...',
              loadedText: '加载完成',
              loadFailedText: '加载失败',
              noMoreText: '没有更多数据',
              infoText: '更新于 %T',
            ),
            onRefresh: _toRefresh,
            onLoad: _toLoad,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return SampleListItem(width: double.infinity);
                  },
                  childCount: _count,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///下拉刷新
  Future _toRefresh() async {
    return await Future.delayed(
      Duration(seconds: 3),
      () {
        print('_toRefresh');
        if (mounted) {
          setState(() {
            _count = 20;
          });
          _controller.resetLoadState();
          _controller.finishRefresh();
        }
      },
    );
  }

  ///上拉加载
  Future _toLoad() async {
    return await Future.delayed(
      Duration(seconds: 3),
      () {
        print('_toLoad');
        if (mounted) {
          setState(() {
            _count += 20;
          });
          _controller.finishLoad(noMore: _count >= 80);
        }
      },
    );
  }
}
