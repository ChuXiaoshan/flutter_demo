import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/list/animated_list_one.dart';
import 'package:flutterdemo/widget/PNetworkImage.dart';

class BikeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bike Detail"),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 250,
                      width: double.infinity,
                      child: PNetworkImage("https://w.wallhaven.cc/full/2k/wallhaven-2kg1xy.jpg", fit: BoxFit.cover),
                    ),
                    Positioned(
                      left: 20.0,
                      bottom: 10.0,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10.0,
                      bottom: 0,
                      child: Chip(
                        elevation: 0,
                        labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        backgroundColor: Theme.of(context).primaryColor,
                        label: Text("Rs. 1,80,000"),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: Text("Key Specs", style: Theme.of(context).textTheme.headline6),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            SpecsBlock(
                              label: "Engine",
                              value: "220 cc",
                              icon: Icon(Icons.apps),
                            ),
                            SpecsBlock(
                              label: "Mileage",
                              value: "150 kmpl",
                              icon: Icon(Icons.apps),
                            ),
                            SpecsBlock(
                              label: "Brakes",
                              value: "ABS",
                              icon: Icon(Icons.apps),
                            ),
                            SpecsBlock(
                              label: "Fuel Tank",
                              value: "1234 kmpl",
                              icon: Icon(Icons.apps),
                            ),
                            SpecsBlock(
                              label: "Da jia che",
                              value: "12 L",
                              icon: Icon(Icons.apps),
                            ),
                            SpecsBlock(
                              label: "Feng Huang",
                              value: "12 L",
                              icon: Icon(Icons.apps),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: Text("Free Gifts", style: Theme.of(context).textTheme.subtitle1),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: Text("helmet, Gloves, Rain Coat, Bike Cover,"),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: Text("Specification", style: Theme.of(context).textTheme.headline6),
                      ),
                      BorderedContainer(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: Text("Manufactured Year"),
                          trailing: Text("2019", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      BorderedContainer(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: Text("Number (Lot)"),
                          trailing: Text("Bagmati 80", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      BorderedContainer(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: Text("Category"),
                          trailing: Text("Standard", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      BorderedContainer(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: Text("Engine Serviced?"),
                          trailing: Text("Half", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      BorderedContainer(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: Text("Ground Clearance"),
                          trailing: Text("150 mm", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      BorderedContainer(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: Text("Seat height"),
                          trailing: Text("700 mm", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton.icon(
                onPressed: () {},
                textColor: Colors.white,
                icon: Icon(Icons.message),
                label: Text("Message Seller"),
                color: Theme.of(context).accentColor),
          ),
        ],
      ),
    );
  }
}

class SpecsBlock extends StatelessWidget {
  const SpecsBlock({Key key, this.icon, this.label, this.value}) : super(key: key);
  final Widget icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            icon,
            SizedBox(height: 2.0),
            Text(label, style: TextStyle(color: Colors.grey.shade800)),
            SizedBox(height: 5.0),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
