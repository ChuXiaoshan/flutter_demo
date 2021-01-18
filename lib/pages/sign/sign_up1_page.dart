import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp1Page extends StatelessWidget {
  SignUp1Page({String title, Color primaryColor})
      : this.primaryColor = primaryColor,
        this.title = title;

  final String title;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80.0),
            Stack(
              children: <Widget>[
                Positioned(
                  left: 20.0,
                  top: 15.0,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20.0)),
                    width: 70.0,
                    height: 20.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.0),
                  child: Text("Sign Up", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Email"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Confirm password"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(text: "By clicking Sign Up you agree to the following "),
                  TextSpan(text: "Terms and Conditions", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
                  TextSpan(text: "without reservations"),
                ]),
              ),
            ),
            SizedBox(height: 60.0),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                color: Colors.yellow,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Sign up".toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    SizedBox(width: 40.0),
                    Icon(FontAwesomeIcons.arrowRight, size: 18.0),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton.icon(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.red,
                  textColor: Colors.red,
                  highlightedBorderColor: Colors.red,
                  borderSide: BorderSide(color: Colors.red),
                  icon: Icon(FontAwesomeIcons.googlePlusG, size: 18.0),
                  label: Text("Google"),
                  onPressed: () {},
                ),
                SizedBox(width: 10.0),
                OutlineButton.icon(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.indigo,
                  textColor: Colors.indigo,
                  highlightedBorderColor: Colors.indigo,
                  borderSide: BorderSide(color: Colors.indigo),
                  icon: Icon(FontAwesomeIcons.facebookF, size: 18.0),
                  label: Text("Facebook"),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
