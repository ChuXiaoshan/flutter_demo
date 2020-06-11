import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final List<Map> items = [
    {"title": "banner", "page": "banner", "icon": Icons.photo},
    {"title": "list_vertical", "page": "list_vertical", "icon": Icons.list},
    {"title": "list_horizontal", "page": "list_horizontal", "icon": Icons.list},
    {"title": "list_load", "page": "list_load", "icon": Icons.list},
    {"title": "bottom", "page": "bottom", "icon": Icons.vertical_align_bottom},
  ];

  _buildItem(BuildContext context, int index) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, items[index]['page']);
        },
        borderRadius: new BorderRadius.circular(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(items[index]["icon"], color: Colors.blue),
            SizedBox(height: 5.0),
            Text(items[index]['title'], style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Demo"),
        elevation: 10,
      ),
      body: GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(4),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _buildItem(context, index);
          }),
    );
  }
}
