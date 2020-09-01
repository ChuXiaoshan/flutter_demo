import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/dialog/custom_dialog1.dart';

class DialogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dialog"),
      ),
      body: GridView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(4),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: InkWell(
              onTap: () {
                _customAlertDialog1(context);
              },
              borderRadius: new BorderRadius.circular(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("alert1", style: TextStyle(color: Colors.purple.shade900)),
                ],
              ),
            ),
          ),
          Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: InkWell(
              onTap: () {},
              borderRadius: new BorderRadius.circular(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("alert2", style: TextStyle(color: Colors.purple.shade900)),
                ],
              ),
            ),
          ),
          Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: InkWell(
              onTap: () {},
              borderRadius: new BorderRadius.circular(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("alert3", style: TextStyle(color: Colors.purple.shade900)),
                ],
              ),
            ),
          ),
          Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: InkWell(
              onTap: () {},
              borderRadius: new BorderRadius.circular(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("alert4", style: TextStyle(color: Colors.purple.shade900)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _customAlertDialog1(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog1Page();
        });
  }
}
