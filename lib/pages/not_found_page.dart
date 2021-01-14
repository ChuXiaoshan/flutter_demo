import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page not found.'),
        elevation: 4.0,
      ),
      body: Center(
        child: Text(" Page not found."),
      ),
    );
  }
}
