import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Created by CxS on 2021/1/11 14:14
/// Description: 简单列表项
class SampleListItem extends StatelessWidget {
  final double width;

  const SampleListItem({Key key, this.width = double.infinity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Container(
              height: 100.0,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  color: Colors.grey[200],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120.0,
                              height: 15.0,
                              color: Colors.grey[200],
                            ),
                            Container(
                              width: 60.0,
                              height: 10.0,
                              margin: EdgeInsets.only(top: 8.0),
                              color: Colors.grey[200],
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 10.0,
                          color: Colors.grey[200],
                        ),
                        SizedBox(height: 4.0),
                        Container(
                          height: 10.0,
                          color: Colors.grey[200],
                        ),
                        SizedBox(height: 4.0),
                        Container(
                          height: 10.0,
                          width: 150.0,
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
