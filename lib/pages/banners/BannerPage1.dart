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

  _buildSlider() {
    return Container(
      height: 220.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return new PNetworkImage(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
              itemCount: 4,
              pagination: new SwiperPagination(),
            ),
          ),
        ],
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
          _buildSlider(),
          _buildSlider(),
          _buildSlider(),
          _buildSlider(),
          _buildSlider(),
          _buildSlider(),
          _buildSlider(),
          _buildSlider(),
          _buildSlider(),
          _buildSlider(),
          _buildSlider(),
          _buildSlider(),
        ],
      ),
    );
  }
}
