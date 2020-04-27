import 'package:flutter/material.dart';
import 'package:onlinerentalapp/userscreens/Auth.dart';
import 'package:onlinerentalapp/userscreens/MyHomePage.dart';
import 'package:onlinerentalapp/userscreens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:onlinerentalapp/userscreens/user.dart';

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
