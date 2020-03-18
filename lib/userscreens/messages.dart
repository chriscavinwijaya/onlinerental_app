import 'package:flutter/material.dart';

class MyMessages extends StatefulWidget {
  @override
  _MyMessagesState createState() => _MyMessagesState();
}

class _MyMessagesState extends State<MyMessages> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("MyMessages"),
          centerTitle: false,
        ),
        body: new Center(
          child: new Text("MyMessages"),
        )
    );
  }
}