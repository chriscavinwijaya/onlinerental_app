import 'package:flutter/material.dart';
import 'userscreens/MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Online Rental',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}
