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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Sliders'),
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _buildSlider1(context),
            _buildSlider2(context),
            _buildSlider3(context),
          ],
        ),
      ),
    );
  }

  _buildSlider1(BuildContext context) {
    return Container(
      height: 240.0,
      color: Colors.blueGrey,
      padding: EdgeInsets.only(bottom: 16.0),
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Hero(
              tag: 'itemnormal$index',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: PNetworkImage(images[index], fit: BoxFit.cover),
              ),
            ),
          );
        },
        itemCount: 4,
        onTap: (index) => _itemTap(context, "normal", index),
        pagination: new SwiperPagination(),
      ),
    );
  }

  _buildSlider2(BuildContext context) {
    return Container(
      height: 220.0,
      color: Colors.blueGrey,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount: images.length,
        onTap: (index) => _itemTap(context, "scale", index),
        itemBuilder: (context, index) => Stack(
          children: <Widget>[
            Hero(
              tag: 'itemscale$index',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: PNetworkImage(images[index], fit: BoxFit.cover, height: 220.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey.withOpacity(0.4),
              ),
              child: Text("Travel Series", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0)),
            ),
          ],
        ),
      ),
    );
  }

  _buildSlider3(BuildContext context) {
    return Container(
      height: 340.0,
      color: Colors.blueGrey,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Swiper(
        fade: 0.0,
        scale: 0.9,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                    image: DecorationImage(image: CachedNetworkImageProvider(images[index]), fit: BoxFit.cover)),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                ),
                child: ListTile(
                  subtitle: Text("awesome image caption"),
                  title: Text("Awesome image"),
                ),
              ),
            ],
          );
        },
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
}
