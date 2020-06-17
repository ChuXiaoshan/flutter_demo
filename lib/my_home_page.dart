import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/page_config.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  List<Map> items;
  Color primaryColor;

  @override
  Widget build(BuildContext context) {
    Map map = ModalRoute.of(context).settings.arguments;
    items = map != null ? showItems : mainItems;
    primaryColor = map != null ? Colors.cyan.shade900 : Colors.purple.shade900;
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: primaryColor,
        title: new Text(map != null ? map["title"] : "Flutter Demo"),
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
        },
      ),
    );
  }

  _buildItem(BuildContext context, int index) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(items[index]['page'], arguments: {"title": items[index]['title']});
        },
        borderRadius: new BorderRadius.circular(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(items[index]["icon"], color: primaryColor),
            SizedBox(height: 5.0),
            Text(items[index]['title'], style: TextStyle(color: primaryColor)),
          ],
        ),
      ),
    );
  }
}
