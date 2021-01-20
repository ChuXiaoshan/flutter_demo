import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './pages/page_config.dart';
import './routers/application.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({String title = 'Flutter Demo', Color primaryColor})
      : this.title = title,
        this.primaryColor = primaryColor;

  String title;
  List<Map> items;
  Color primaryColor;

  @override
  Widget build(BuildContext context) {
    if (title == 'Flutter Demo') {
      items = mainItems;
    } else if (title == 'show') {
      items = showItems;
    } else if (title == 'refresh') {
      items = refreshItems;
    }
    primaryColor =
        (primaryColor == null) ? Colors.purple.shade900 : primaryColor;
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: primaryColor,
        title: new Text(title),
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
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: InkWell(
        onTap: () {
          Application.router.navigateTo(
            context,
            '${items[index]['page']}?title=${items[index]['title']}&color=${items[index]['color']}',
          );
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
