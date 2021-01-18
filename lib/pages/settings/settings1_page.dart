import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings1Page extends StatefulWidget {
  Settings1Page({String title, Color primaryColor})
      : this.primaryColor = primaryColor,
        this.title = title;

  final String title;
  final Color primaryColor;

  @override
  State<StatefulWidget> createState() {
    return _Settings1PageState(primaryColor: primaryColor, title: title);
  }
}

class _Settings1PageState extends State<Settings1Page> {
  _Settings1PageState({String title, Color primaryColor})
      : this.primaryColor = primaryColor,
        this.title = title;

  final String title;
  final Color primaryColor;

  bool _dark;
  bool _isReceive = false;

  @override
  void initState() {
    super.initState();
    _dark = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      isMaterialAppTheme: true,
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            "Settings",
            style: TextStyle(color: _dark ? Colors.white : Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.moon),
              onPressed: () {
                setState(() {
                  _dark = !_dark;
                });
              },
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.purple,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () {},
                      child: ListTile(
                        title: Text("John Doe", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider("https://pic4.zhimg.com/v2-d1e84c8a02a3042517c0c1b953f9d7d7_xl.jpg"),
                        ),
                        trailing: Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Card(
                    elevation: 4.0,
                    margin: EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                          onTap: () {},
                          child: ListTile(
                            leading: Icon(Icons.lock_outline, color: Colors.purple),
                            title: Text("change Password"),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                        ),
                        _buildDivider(),
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Icon(Icons.lock_outline, color: Colors.purple),
                            title: Text("change Password"),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                        ),
                        _buildDivider(),
                        InkWell(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
                          onTap: () {},
                          child: ListTile(
                            leading: Icon(Icons.lock_outline, color: Colors.purple),
                            title: Text("change Password"),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Notification Settings",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: EdgeInsets.all(0),
                    value: _isReceive,
                    title: Text("Received notification"),
                    onChanged: (val) {
                      setState(() {
                        _isReceive = !_isReceive;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: EdgeInsets.all(0),
                    value: _isReceive,
                    title: Text("Received newsletter"),
                    onChanged: (val) {
                      setState(() {
                        _isReceive = !_isReceive;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: EdgeInsets.all(0),
                    value: _isReceive,
                    title: Text("Received Offer Notification"),
                    onChanged: (val) {
                      setState(() {
                        _isReceive = !_isReceive;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: EdgeInsets.all(0),
                    value: false,
                    title: Text("Received App updates"),
                    onChanged: null,
                  ),
                  SizedBox(height: 60.0),
                ],
              ),
            ),
            Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.powerOff,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
