import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtmNavBarExp extends StatefulWidget {
  const BtmNavBarExp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BtmNavBarExpState();
}

class _BtmNavBarExpState extends State<BtmNavBarExp> {
  int _currentTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
      Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
      Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
      Center(child: Icon(Icons.map, size: 64.0, color: Colors.yellow)),
    ];
    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.cloud), title: Text('Tab1')),
      BottomNavigationBarItem(icon: Icon(Icons.alarm), title: Text('Tab2')),
      BottomNavigationBarItem(icon: Icon(Icons.forum), title: Text('Tab3')),
      BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Tab4')),
    ];
    assert(_kTabPages.length == _kBottomNavBarItems.length);
    final btmNavBar = BottomNavigationBar(
      items: _kBottomNavBarItems,
      currentIndex: _currentTabIndex,
      selectedFontSize: 12.0,
      elevation: 12,
      backgroundColor: Colors.white,
      unselectedFontSize: 12.0,
      type: BottomNavigationBarType.fixed,
      onTap: (int i) => setState(() => _currentTabIndex = i),
    );
    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: btmNavBar,
    );
  }
}
