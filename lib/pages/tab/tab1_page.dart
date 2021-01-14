import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/PNetworkImage.dart';

final List<Map> articles = [
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "How to Seem Like You Always Have Your Shot Together",
    "author": "Jonhy Vino",
    "time": "4 min read",
  }
];

class Tab1Page extends StatelessWidget {
  final Color primaryColor = Color(0xFFFD6592);
  final Color bgColor = Color(0xFFF9E0E3);
  final Color secondaryColor = Color(0xFF324558);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(headline6: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold, fontSize: 20.0)),
            iconTheme: IconThemeData(color: secondaryColor),
            actionsIconTheme: IconThemeData(color: secondaryColor),
          ),
        ),
        child: Scaffold(
          backgroundColor: Theme.of(context).buttonColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text("Categories"),
            leading: Icon(Icons.category),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              unselectedLabelColor: secondaryColor,
              tabs: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("For You"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Design"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Beauty"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Education"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Entertainment"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView.separated(
                itemBuilder: (context, index) => _buildArticleItem(index),
                separatorBuilder: (context, index) => SizedBox(height: 16.0),
                itemCount: articles.length,
                padding: EdgeInsets.all(16.0),
              ),
              Container(child: Text("Tab 2")),
              Container(child: Text("Tab 3")),
              Container(child: Text("Tab 4")),
              Container(child: Text("Tab 5")),
            ],
          ),
        ),
      ),
    );
  }

  _buildArticleItem(int index) {
    Map article = articles[index];
    final String sample = "https://th.wallhaven.cc/small/2e/2evglg.jpg";
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            color: bgColor,
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  color: Colors.blue,
                  width: 80.0,
                  child: PNetworkImage(
                    sample,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        article["title"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(child: CircleAvatar(radius: 15.0, backgroundColor: primaryColor)),
                            WidgetSpan(child: SizedBox(width: 5.0)),
                            TextSpan(text: article['author'], style: TextStyle(fontSize: 16.0)),
                            WidgetSpan(child: SizedBox(width: 20.0)),
                            WidgetSpan(child: SizedBox(width: 5.0)),
                            TextSpan(text: article['time']),
                          ],
                        ),
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
