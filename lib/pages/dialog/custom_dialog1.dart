import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 370,
        child: Dialog(
          child: Column(
            children: <Widget>[
              Text(
                "Thank you!",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
