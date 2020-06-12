import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutterdemo/widget/PNetworkImage.dart';

class SignUpPage extends StatelessWidget {
  _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 30.0),
          CircleAvatar(child: PNetworkImage("https://th.wallhaven.cc/small/2e/2evglg.jpg"), maxRadius: 50, backgroundColor: Colors.transparent),
          SizedBox(height: 20.0),
          _buildLoginForm(),
        ],
      ),
    );
  }

  _buildLoginForm() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 400,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40.0)), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 90.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        hintText: "Emial address",
                        hintStyle: TextStyle(color: Colors.blue.shade200),
                        border: InputBorder.none,
                        icon: Icon(Icons.email, color: Colors.blue),
                      ),
                    ),
                  ),
                  Container(child: Divider(color: Colors.blue.shade400), padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.blue.shade200),
                        border: InputBorder.none,
                        icon: Icon(Icons.lock, color: Colors.blue),
                      ),
                    ),
                  ),
                  Container(child: Divider(color: Colors.blue.shade400), padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Colors.blue.shade200),
                        border: InputBorder.none,
                        icon: Icon(Icons.lock, color: Colors.blue),
                      ),
                    ),
                  ),
                  Container(child: Divider(color: Colors.blue.shade400), padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildPageContent(context));
  }
}
