import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterdemo/widget/PNetworkImage.dart';

class BannerPage1 extends StatelessWidget {
  final List<String> images = [
    "https://w.wallhaven.cc/full/ey/wallhaven-eymzjk.jpg",
    "https://w.wallhaven.cc/full/md/wallhaven-md5z28.jpg",
    "https://w.wallhaven.cc/full/ym/wallhaven-ymoo2x.jpg",
    "https://w.wallhaven.cc/full/ox/wallhaven-oxv6gl.png"
  ];

  _buildSlider1(BuildContext context) {
    return Container(
      height: 220.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Hero(tag: 'itemnormal$index', child: PNetworkImage(images[index], fit: BoxFit.cover));
              },
              itemCount: 4,
              onTap: (index) => _itemTap(context, "normal", index),
              pagination: new SwiperPagination(),
            ),
          ),
        ],
      ),
    );
  }

  _buildSlider2(BuildContext context) {
    return Container(
      height: 220.0,
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount: images.length,
        onTap: (index) => _itemTap(context, "scale", index),
        itemBuilder: (context, index) => Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey.withOpacity(0.4),
              ),
              child: Text(
                "Travel Series",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _itemTap(BuildContext context, String type, int index) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Top quality fashion item"),
            ),
            body: Material(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Hero(tag: "item$type$index", child: PNetworkImage(images[index % images.length], fit: BoxFit.cover))),
                      SizedBox(height: 10.0),
                      Text('Top Quality fashion item', softWrap: true),
                      SizedBox(height: 10.0),
                      Text("Rs.1,245", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.red)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Flutter UIs'),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          _buildSlider1(context),
          _buildSlider2(context),
        ],
      ),
    );
  }
}
