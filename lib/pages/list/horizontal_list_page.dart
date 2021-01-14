import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/PNetworkImage.dart';

class HorizontalListPage extends StatelessWidget {
  final List<Map> collections = [
    {"title": "Food joint", "image": "https://w.wallhaven.cc/full/x1/wallhaven-x1wroo.jpg"},
    {"title": "Photo", "image": "https://w.wallhaven.cc/full/r2/wallhaven-r2ze21.jpg"},
    {"title": "Travel", "image": "https://w.wallhaven.cc/full/vm/wallhaven-vmy7l8.jpg"},
    {"title": "Nepal", "image": "https://w.wallhaven.cc/full/x1/wallhaven-x1wroo.jpg"},
    {"title": "Grils", "image": "https://w.wallhaven.cc/full/13/wallhaven-13vym3.jpg"},
    {"title": "Nature", "image": "https://w.wallhaven.cc/full/ym/wallhaven-ym3rpk.jpg"},
    {"title": "Snow", "image": "https://w.wallhaven.cc/full/ym/wallhaven-ymwj9d.jpg"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal list page'),
      ),
      body: Container(
        height: 170.0,
        color: Colors.white,
        padding: EdgeInsets.only(top: 16.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: collections.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 170.0,
              height: 200.0,
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: PNetworkImage(collections[index]['image'], fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(collections[index]['title'], style: Theme.of(context).textTheme.subhead.merge(TextStyle(color: Colors.grey.shade600)))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
