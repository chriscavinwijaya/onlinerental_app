import 'package:flutter/material.dart';

class MySearch extends StatefulWidget {
  @override
  _MySearchState createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Search"),
          centerTitle: false,
        ),
        body: new Center(
          child: new Text("Search"),
        )
    );
  }
}