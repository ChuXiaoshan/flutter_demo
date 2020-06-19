import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/widget/PNetworkImage.dart';

final List rooms = [
  {
    "image": "https://w.wallhaven.cc/full/48/wallhaven-48dvl2.jpg",
    "title": "Good luck",
  },
  {
    "image": "https://w.wallhaven.cc/full/43/wallhaven-436kgv.jpg",
    "title": "Bed better",
  },
  {
    "image": "https://w.wallhaven.cc/full/5w/wallhaven-5wzwy7.jpg",
    "title": "Surprise",
  },
  {
    "image": "https://w.wallhaven.cc/full/ne/wallhaven-neevko.jpg",
    "title": "Comfortable",
  },
  {
    "image": "https://w.wallhaven.cc/full/n6/wallhaven-n673ww.jpg",
    "title": "Hello",
  }
];

class Hotel1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 180.0,
            backgroundColor: Colors.cyan,
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {},
              )
            ],
            floating: true,
            flexibleSpace: ListView(
              children: <Widget>[
                SizedBox(height: 70.0),
                Text("Type your Location",
                    textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Bouddha, Kathmandu",
                      border: InputBorder.none,
                      icon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10.0)),
          SliverToBoxAdapter(child: _buildCategories()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildRooms(context, index);
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }

  _buildRooms(BuildContext context, int index) {
    var room = rooms[index % rooms.length];
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    PNetworkImage(room['image'], fit: BoxFit.cover),
                    Positioned(right: 10, top: 10, child: Icon(Icons.star, color: Colors.grey.shade800, size: 20.0)),
                    Positioned(right: 8.0, top: 8.0, child: Icon(Icons.star_border, color: Colors.white, size: 24.0)),
                    Positioned(bottom: 20.0, right: 10.0, child: Container(padding: EdgeInsets.all(10.0), color: Colors.white, child: Text("\$40"))),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(room['title'], style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5.0),
                      Text("Bouddha, Kathmandu"),
                      SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.green),
                          Icon(Icons.star, color: Colors.green),
                          Icon(Icons.star, color: Colors.green),
                          Icon(Icons.star, color: Colors.green),
                          Icon(Icons.star, color: Colors.green),
                          SizedBox(width: 5.0),
                          Text("(220 reviews)", style: TextStyle(color: Colors.grey))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildCategories() {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 15.0),
          Category(backgroundColor: Colors.pink, icon: Icons.hotel, title: "Hotel"),
          SizedBox(width: 15.0),
          Category(backgroundColor: Colors.blue, title: "Restaurant", icon: Icons.restaurant),
          SizedBox(width: 15.0),
          Category(backgroundColor: Colors.orange, title: "Cafe", icon: Icons.local_cafe),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color backgroundColor;

  const Category({Key key, @required this.icon, @required this.title, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(10.0),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: Colors.white),
            SizedBox(height: 5.0),
            Text(title, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
