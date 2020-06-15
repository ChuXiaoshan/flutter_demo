import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              Container(child: Text("Tab 1")),
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
}
