import 'package:flutter/material.dart';

class MyRentHistory extends StatefulWidget {
  @override
  _MyRentHistoryState createState() => _MyRentHistoryState();
}

class _MyRentHistoryState extends State<MyRentHistory> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text( "My Rent History" ),
          centerTitle: false,
        ),
        body: new Center(
          child: new Text( "My Rent History" ),
        )
    );
  }
}