import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../pages/home/rounded_container.dart';
import '../../widget/PNetworkImage.dart';

class Home1Page extends StatelessWidget {
  Home1Page({String title, Color primaryColor})
      : this.primaryColor = primaryColor,
        this.title = title;

  final String title;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          _buildFeatureNews(),
          const SizedBox(height: 10.0),
          _buildHeading("Popular posts"),
          _buildListItem(Colors.green.shade200),
          _buildListItem(Colors.red.shade200),
          _buildListItem(Colors.blue.shade200),
          _buildListItem(Colors.red.shade200),
          _buildHeading("Browse by category"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade200,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade200,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade200,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade200,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade200,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade200,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildListItem(Color color) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "Lorem ipsum dolor sit amet, consecteutur adsd Ut adipisicing dolore incididunt minim",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Mollit aliquip fugiat veniam reprehenderit irure commodo eu aute ex commodo")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildHeading(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.grey.shade600),
            ),
          ),
          MaterialButton(
            elevation: 0,
            textColor: Colors.white,
            color: Colors.teal.shade300,
            height: 0,
            child: Icon(Icons.keyboard_arrow_right),
            minWidth: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: EdgeInsets.all(2.0),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildFeatureNews() {
    return RoundedContainer(
      padding: EdgeInsets.only(top: 40),
      height: 310,
      borderRadius: BorderRadius.circular(0),
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Featured News", style: TextStyle(fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.bold)),
          Expanded(
            child: Swiper(
              pagination: SwiperPagination(margin: EdgeInsets.only()),
              viewportFraction: 0.9,
              itemCount: 4,
              loop: false,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundedContainer(
                    borderRadius: BorderRadius.circular(4.0),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text("A complete set of design elements, and their intitutive design", style: Theme.of(context).textTheme.headline6),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.red,
                            child: PNetworkImage("https://th.wallhaven.cc/small/dg/dgzj9o.jpg", fit: BoxFit.cover, height: 210),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
