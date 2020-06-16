import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterdemo/pages/home/rounded_container.dart';
import 'package:flutterdemo/widget/PNetworkImage.dart';

class Home1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          _buildFeatureNews(),
          const SizedBox(height: 10.0),
        ],
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
              style: shadedTitle,
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
      height: 270,
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
