import 'package:flutter/material.dart';

class MyNotifications extends StatefulWidget {
  @override
  _MyNotificationsState createState() => _MyNotificationsState();
}

class _MyNotificationsState extends State<MyNotifications> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.greenAccent,
          title: new Text("My Notifications"),
          centerTitle: false,
        ),
        body: new Center(
          child: new Text("My Notifications"),
        ));
  }
}
