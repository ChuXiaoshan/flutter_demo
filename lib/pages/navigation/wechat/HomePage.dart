import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  HomePage({this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(content),
    );
  }
}
