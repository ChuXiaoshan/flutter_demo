import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routers/application.dart';
import '../../routers/routers.dart';

class ListLoadPage extends StatefulWidget {
  ListLoadPage({String title, Color primaryColor, String url})
      : this.title = title,
        this.primaryColor = primaryColor;

  final Color primaryColor;
  final String title;

  @override
  State<StatefulWidget> createState() => _ListLoadPageState(title: title, primaryColor: primaryColor);
}

class _ListLoadPageState extends State<ListLoadPage> {
  _ListLoadPageState({String title, Color primaryColor, String url})
      : this.title = title,
        this.primaryColor = primaryColor;

  final Color primaryColor;
  final String title;

  List data = [];
  int page = 0;
  bool loading = false;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    this._onRefresh();
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _onLoadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(title),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.separated(
            controller: _scrollController,
            itemCount: data.length + 1,
            itemBuilder: (context, index) {
              if (index == data.length && index > 51) {
                loading = true;
                return _endWidget();
              } else {
                if (index == data.length) {
                  return _loadMoreWidget();
                } else {
                  return _itemWidget(context, index);
                }
              }
            },
            separatorBuilder: (context, index) => Divider(height: .0)),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  _fetchData() async {
    if (!loading) {
      loading = true;
      Response response = await Dio().get("https://www.wanandroid.com/article/list/${this.page}/json");
      var json = JsonDecoder().convert(response.toString());
      loading = false;
      return json["data"]["datas"];
    }
  }

  Future<dynamic> _onRefresh() {
    loading = false;
    data.clear();
    this.page = 0;
    return _fetchData().then((data) {
      setState(() {
        this.data.addAll(data);
      });
    });
  }

  Future<dynamic> _onLoadMore() {
    this.page++;
    return _fetchData().then((data) {
      setState(() {
        this.data.addAll(data);
      });
    });
  }

  _itemWidget(BuildContext context, int index) {
    return ListTile(
      onTap: () {
        var url = data[index]['link'];
        var title = data[index]['title'];
        var color = primaryColor.value.toString();
        print("color---$color");
        var path = '${Routers.browser}?title=heheh&color=$color&url=$url';
        print(path);
        Application.router.navigateTo(context, path);
      },
      title: Text(data[index]['title']),
      subtitle: Text(data[index]['chapterName']),
    );
  }

  _loadMoreWidget() {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Center(child: new CircularProgressIndicator()),
    );
  }

  _endWidget() {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Center(
          child: Text(
        "到底啦！",
        style: TextStyle(color: Colors.grey[500]),
      )),
    );
  }
}
