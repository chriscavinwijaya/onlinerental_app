import 'package:flutter/material.dart';

class MySettings extends StatefulWidget {
  @override
  _MySettingsState createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("My Settings"),
          centerTitle: false,
        ),
        body: new Center(
          child: new Text("My Settings"),
        )
    );
  }
}