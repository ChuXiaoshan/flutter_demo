import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListLoadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListLoadPageState();
}

class _ListLoadPageState extends State<ListLoadPage> {
  List data = [];
  int page = 0;

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
        title: Text("Infinite ListView"),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
            controller: _scrollController,
            itemCount: data.length + 1,
            itemBuilder: (context, index) {
              return (index == data.length) ? _loadMoreWidget() : _itemWidget(context, index);
            }),
      ),
    );
  }

  _fetchData() async {
    Response response = await Dio().get("https://www.wanandroid.com/article/list/${this.page}/json");
    var json = JsonDecoder().convert(response.toString());
    print(json);
    print(response);
    var ddd = json["data"]["datas"];
    print("---json--->");
    print(ddd);
    return ddd;
  }

  Future<dynamic> _onRefresh() {
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
}

class ArticleList {
  final String title;
  final String chapterName;

  ArticleList(this.title, this.chapterName);

  ArticleList.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        chapterName = json['chapterName'];

  Map<String, dynamic> toJson() => {"title": title, "chapterName": chapterName};
}
