import 'package:flutter/material.dart';
import 'package:SustainableFashion/services/Auth.dart';
import 'package:SustainableFashion/userscreens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:SustainableFashion/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        // This widget is the root of your application.
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
//    Theme
//        theme: ThemeData(
//          primaryColor: Colors.greenAccent,
//          accentColor: Colors.cyanAccent,
//        ),
      ),
    );
  }
}
